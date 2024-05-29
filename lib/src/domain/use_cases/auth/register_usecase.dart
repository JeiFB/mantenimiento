import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegisterUseCase {

  AuthRepository _repository;

  RegisterUseCase(this._repository);

  launch(UserData user) => _repository.register(user);

}