import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/list/posts_list_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/list/widgets/posts_list_item.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostsListPage extends StatelessWidget {
  const PostsListPage({super.key});

  @override
  Widget build(BuildContext context) {

    PostsListViewModel vm = Provider.of<PostsListViewModel>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: StreamBuilder(
        stream: vm.getPosts(),
        builder: ((context, snapshot) { 
          final response = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }        
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                'No hay informacion',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (response is Error) {
            final data = response as Error;
            return Center(
              child: Text('Error: ${data.error}'),
            );
          }
          final postList = response as Success<List<Post>>;
          return ListView.builder(
            itemBuilder: (context, index) => PostsListItem(vm, postList.data[index]),
            itemCount: postList.data.length,            
          );
        }),
      )
    );
  }
}