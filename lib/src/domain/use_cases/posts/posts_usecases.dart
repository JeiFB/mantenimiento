import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/create_post_usecase.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/delete_like_post_usecase.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/delete_post_usecase.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/get_posts_by_id_usecase.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/get_posts_usecase.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/like_post_usecase.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/update_post_image_usecase.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/update_post_usecase.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class PostsUseCases {

  CreatePostUseCase create;
  GetPostsUseCase getPosts;
  UpdatePostUseCase update;
  UpdatePostImageUseCase updateWithImage;
  GetPostsByIdUseCase getPostsById;
  DeletePostUseCase delete;
  LikePostUseCase like;
  DeleteLikePostUseCase deleteLike;

  PostsUseCases({
    required this.create,
    required this.getPosts,
    required this.update,
    required this.updateWithImage,
    required this.getPostsById,
    required this.delete,
    required this.like,
    required this.deleteLike,
  });

}