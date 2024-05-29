import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/posts_repository.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetPostsByIdUseCase {

  PostsRepository _repository;

  GetPostsByIdUseCase(this._repository);

  Stream<Resource<List<Post>>> launch(String id) => _repository.getPostsById(id);

}