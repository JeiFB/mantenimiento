import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/users_repository.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetUserById {

  UsersRepository _repository;

  GetUserById(this._repository);

  Stream<Resource<UserData>> launch(String id) => _repository.getUserById(id);

}