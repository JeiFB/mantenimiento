import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_gamer_mvvm/src/core/constants.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/posts_repository.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@Injectable(as: PostsRepository)
class PostsRepositoryImpl implements PostsRepository {

  CollectionReference _postsRef;
  Reference _postsStorageRef;

  PostsRepositoryImpl(
    @Named(POSTS) this._postsRef, 
    @Named(POSTS) this._postsStorageRef
  );

  @override
  Future<Resource<String>> create(Post post, File image) async {
    try {
      String name = basename(image.path);
      TaskSnapshot uploadTask = await _postsStorageRef.child(name).putFile(image, SettableMetadata(
        contentType: 'image/png',        
      ));
      String url = await uploadTask.ref.getDownloadURL();  
      post.image = url;          
      final data = await _postsRef.add(post.toJson());
      return Success('El posts se ha creado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
  
  @override
  Stream<Resource<List<Post>>> getPosts() {
    try {
      final data = _postsRef.snapshots(includeMetadataChanges: true);
      final dataMap = data.map((document) => Success(
          document.docs.map(
            (post) {
              final id = post.id;

              final map = {
                ...post.data() as Map<String, dynamic>,
                'id': id
              };
              return Post.fromJson(map);
            }
          ).toList()
        )
      );
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }
  
  @override
  Stream<Resource<List<Post>>> getPostsById(String id) {
    try {
      final data = _postsRef.where('id_user', isEqualTo: id).snapshots(includeMetadataChanges: true);
      
      final dataMap = data.map((document) => Success(
          document.docs.map(
            (post) {
              final id = post.id;
              final map = {
                ...post.data() as Map<String, dynamic>,
                'id': id
              };
              return Post.fromJson(map);
            }
          ).toList()
        )
      );
      return dataMap;
    } on FirebaseException catch (e) {
      throw Error(e.message ?? 'Error desconocido');
    }
  }
  
  @override
  Future<Resource<String>> delete(String idPost) async {
    try {
      await _postsRef.doc(idPost).delete();
      return Success('El posts se ha eliminado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
  
  @override
  Future<Resource<String>> update(Post post) async {
    try {
      Map<String, dynamic> map = {
        'name': post.name,
        'description': post.description,
        'category': post.category
      };
      final data = await _postsRef.doc(post.id).update(map);
      return Success('El posts se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
  
  @override
  Future<Resource<String>> updateWithImage(Post post, File image) async {
    try {

      String name = basename(image.path);
      TaskSnapshot uploadTask = await _postsStorageRef.child(name).putFile(image, SettableMetadata(
        contentType: 'image/png',        
      ));
      String url = await uploadTask.ref.getDownloadURL();

      Map<String, dynamic> map = {
        'name': post.name,
        'description': post.description,
        'category': post.category,
        'image': url,                
      };
      final data = await _postsRef.doc(post.id).update(map);
      return Success('El posts se ha actualizado correctamente');
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
  
  @override
  Future<Resource<bool>> deleteLike(String idPost, String idUser) async {
    try {
      await _postsRef.doc(idPost).update({'likes': FieldValue.arrayRemove([idUser])});
      return Success(true);
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }
  
  @override
  Future<Resource<bool>> like(String idPost, String idUser) async {
    try {      
      await _postsRef.doc(idPost).update({'likes': FieldValue.arrayUnion([idUser])});
      return Success(true);
    } on FirebaseException catch (e) {
      return Error(e.message ?? 'Error desconocido');
    }
  }

}