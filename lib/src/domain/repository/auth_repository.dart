import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';

abstract class AuthRepository {

  User? get user;
  Future<Resource> login({required String email, required String password });
  Future<Resource> register(UserData user);
  Future<void> logout();

}