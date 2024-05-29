import 'package:flutter/foundation.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/posts_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';

class PostsMyListViewModel extends ChangeNotifier {

  PostsUseCases _postsUseCases;
  AuthUseCases _authUseCases;

  PostsMyListViewModel(this._authUseCases, this._postsUseCases);

  Stream<Resource<List<Post>>> getPostsById() {
    String idUser = _authUseCases.getUser.userSession?.uid ?? '';
    return _postsUseCases.getPostsById.launch(idUser);
  }

  deletePost(String idPost) async {
    await _postsUseCases.delete.launch(idPost);
    notifyListeners();
  }

}