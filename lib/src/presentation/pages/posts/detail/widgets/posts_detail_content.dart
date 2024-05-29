import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/post.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/detail/posts_detail_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/detail/widgets/posts_detail_userinfo.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';

class PostsDetailContent extends StatelessWidget {
  PostsDetailViewModel vm;
  Post postArg;

  PostsDetailContent(this.vm, this.postArg);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Image(
              image: NetworkImage(postArg.image),
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 10),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  )),
            )
          ],
        ),
        FutureBuilder(
            future: vm.getUser(postArg.idUser),
            builder: ((context, snapshot) {
              if (snapshot.data == null) {
                return Container();
              }
              final data = snapshot.data;
              return Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
                height: 90,
                child: Card(
                    color: const Color.fromARGB(255, 58, 58, 58),
                    child: PostsDetailUserInfo(data!)),
              );
            })),
        Container(
          margin: EdgeInsets.only(left: 25, top: 10),
          child: Text(
            ' PLACA ${postArg.name}',
            style: TextStyle(
                color: BASE_COLOR, fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
        Container(
          height: 50,
          // width: 100,
          margin: EdgeInsets.only(left: 20, top: 15),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 58, 58, 58),
              borderRadius: BorderRadius.circular(20)),
          child: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  'Hora de mantenimiento: ${postArg.category}',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              )
            ],
          ),
        ),
        Divider(
          color: const Color.fromARGB(255, 89, 89, 89),
          endIndent: 20,
          indent: 20,
          height: 50,
        ),
        Container(
          margin: EdgeInsets.only(left: 20),
          child: Text(
            'FECHA DE MANTENIMIENTO',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 15),
          child: Text(
            postArg.description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
