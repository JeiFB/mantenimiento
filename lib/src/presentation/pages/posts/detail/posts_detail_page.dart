import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/detail/posts_detail_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/detail/widgets/posts_detail_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostsDetailPage extends StatelessWidget {

  PostsDetailPage();

  @override
  Widget build(BuildContext context) {
    PostsDetailViewModel vm = Provider.of<PostsDetailViewModel>(context);
    Post postArg = ModalRoute.of(context)?.settings.arguments as Post;
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: PostsDetailContent(vm, postArg),
    );
  }
  
}