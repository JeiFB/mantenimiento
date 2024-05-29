import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/my_list/posts_my_list_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';

class PostsMyListItem extends StatelessWidget {

  Post post;
  PostsMyListViewModel vm;

  PostsMyListItem(this.vm, this.post);

  @override
  Widget build(BuildContext context) {
    print('POSTS ID: ${post.id}');
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Card(
        color: Color.fromARGB(255, 43, 43, 43),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(post.image),
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        post.name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Text(
                        post.description,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                      )
                    ),
                  ],
                ),
                Column(
                  
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context, 
                          'posts/update',
                          arguments: post
                        );
                      }, 
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 27,
                      )
                    ),
                    IconButton(
                      onPressed: () {
                        vm.deletePost(post.id);
                      }, 
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                        size: 27,
                      )
                    ),
                  ],
                )
              ],
            )
            
          ],
        ),
      ),
    );
  }
}