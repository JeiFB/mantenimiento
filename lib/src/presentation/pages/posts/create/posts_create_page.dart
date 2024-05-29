import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/posts_create_response.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/posts_create_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/widgets/posts_create_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostsCreatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PostsCreateViewModel vm = Provider.of<PostsCreateViewModel>(context);
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        PostsCreateResponse(context, vm);
    });

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: PostsCreateContent(vm),
    );
  }
}