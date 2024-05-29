import 'package:flutter_gamer_mvvm/src/domain/repository/users_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetUserByIdOnce {

  UsersRepository _repository;

  GetUserByIdOnce(this._repository);

  launch(String id) => _repository.getUserByIdOnce(id);

}