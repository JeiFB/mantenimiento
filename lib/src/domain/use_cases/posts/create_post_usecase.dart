import 'dart:io';

import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/posts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreatePostUseCase {

  PostsRepository _repository;

  CreatePostUseCase(this._repository);

  launch(Post post, File image) => _repository.create(post, image);

}