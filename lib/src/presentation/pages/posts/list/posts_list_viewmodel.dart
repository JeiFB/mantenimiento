import 'package:flutter/foundation.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/posts_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/users/users_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';

class PostsListViewModel extends ChangeNotifier {

  PostsUseCases _postsUseCases;
  AuthUseCases _authUseCases;
  UsersUseCase _usersUseCase;
  String _id = '';
  String get id => _id;

  PostsListViewModel(this._authUseCases, this._postsUseCases, this._usersUseCase) {
    _id = _authUseCases.getUser.userSession?.uid ?? '';
  }

  Stream<Resource<List<Post>>> getPosts() => _postsUseCases.getPosts.launch();
  Future<UserData> getUserInfo(String idUser) => _usersUseCase.getUserByIdOnce.launch(idUser);


  like(String idPost) async {
    await _postsUseCases.like.launch(idPost, id);
  }

  deleteLike(String idPost) async {
    await _postsUseCases.deleteLike.launch(idPost, id);
  }

}