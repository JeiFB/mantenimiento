import 'dart:io';

import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/repository/posts_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdatePostImageUseCase {

  PostsRepository _repository;

  UpdatePostImageUseCase(this._repository);

  launch(Post post, File file) => _repository.updateWithImage(post, file);

}