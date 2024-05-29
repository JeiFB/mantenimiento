import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/update/posts_update_response.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/update/posts_update_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/update/widgets/posts_update_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostsUpdatePage extends StatelessWidget {

  const PostsUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    PostsUpdateViewModel vm = Provider.of<PostsUpdateViewModel>(context);
    Post postArg = ModalRoute.of(context)?.settings.arguments as Post;
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      PostsUpdateResponse(context, vm);
    });

    return  Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: FutureBuilder(
        future: vm.loadData(postArg),
        builder: (context, _) => PostsUpdateContent(vm, postArg)
      ),
    );
    
  }
}