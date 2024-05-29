import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/posts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class DeleteLikePostUseCase {

  PostsRepository _repository;

  DeleteLikePostUseCase(this._repository);

  launch(String idPost, String idUser) => _repository.deleteLike(idPost, idUser);

}