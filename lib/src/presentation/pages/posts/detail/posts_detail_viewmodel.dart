import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/posts_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/users/users_usecases.dart';

class PostsDetailViewModel extends ChangeNotifier {

  PostsUseCases _postsUseCases;
  UsersUseCase _usersUseCase;

  PostsDetailViewModel(this._postsUseCases, this._usersUseCase);

  Future<UserData> getUser(String id) => _usersUseCase.getUserByIdOnce.launch(id); 

}