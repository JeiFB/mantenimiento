import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/posts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdatePostUseCase {

  PostsRepository _repository;

  UpdatePostUseCase(this._repository);

  launch(Post post) => _repository.update(post);

}