import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserSessionUseCase {

  AuthRepository _repository;

  UserSessionUseCase(this._repository);

  User? get userSession => this._repository.user;

}