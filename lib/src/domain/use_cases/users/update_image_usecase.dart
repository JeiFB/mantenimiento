import 'dart:io';

import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/users_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdateWithImageUseCase {

  UsersRepository _repository;

  UpdateWithImageUseCase(this._repository);

  launch(UserData userData, File image) => _repository.updateWithImage(userData, image); 

}