import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/list/posts_list_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/list/widgets/posts_list_userinfo.dart';

class PostsListItem extends StatelessWidget {
  final Post post;
  final PostsListViewModel vm;

  const PostsListItem(this.vm, this.post);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'posts/detail', arguments: post);
      },
      child: Container(
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
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                          child: Text(
                            post.name,
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      PostsListUserInfo(vm, post.idUser),
                      Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 10),
                          child: Text(
                            post.description,
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          )),
                    ],
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 25),
                    child: Icon(
                      Icons.car_repair,
                      color: Colors.white,
                      size: 50,
                    ),
                  )
                  // post.likes.contains(vm.id)
                  //     ? GestureDetector(
                  //         onTap: () {
                  //           vm.deleteLike(post.id);
                  //         },
                  //         child: Image.asset(
                  //           'assets/img/like.png',
                  //           width: 30,
                  //           height: 30,
                  //         ),
                  //       )
                  //     : GestureDetector(
                  //         onTap: () {
                  //           vm.like(post.id);
                  //         },
                  //         child: Image.asset(
                  //           'assets/img/like_outline.png',
                  //           width: 30,
                  //           height: 30,
                  //         ),
                  //       ),
                  // Container(
                  //   margin: EdgeInsets.only(right: 20, left: 10),
                  //   child: Text(
                  //     post.likes.length.toString(),
                  //     style: TextStyle(color: Colors.white, fontSize: 19),
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
