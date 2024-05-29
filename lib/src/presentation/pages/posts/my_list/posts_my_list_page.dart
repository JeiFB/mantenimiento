import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/my_list/posts_my_list_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/my_list/widgets/posts_my_list_item.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class PostsMyListPage extends StatelessWidget {

  const PostsMyListPage({super.key});

  @override
  Widget build(BuildContext context) {

    PostsMyListViewModel vm = Provider.of<PostsMyListViewModel>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: StreamBuilder(
        stream: vm.getPostsById(),
        builder: ((context, snapshot) {  
          final response = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }        
          if (!snapshot.hasData) {
            return Center(
              child: Text('No hay informacion'),
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
            itemBuilder: (context, index) => PostsMyListItem(vm, postList.data[index]),
            itemCount: postList.data.length,            
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'posts/create');
        },
        backgroundColor: BASE_COLOR,
        child: Icon(Icons.add),
      ),
    );
  }
}