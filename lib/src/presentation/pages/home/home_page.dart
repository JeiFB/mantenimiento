import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/home/home_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/home/widgets/home_bottom_bar.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/list/posts_list_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/my_list/posts_my_list_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/info/profile_info_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_button.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    HomeViewModel vm = Provider.of<HomeViewModel>(context);
    
    final currentTab = [
      PostsListPage(),
      PostsMyListPage(),
      ProfileInfoPage()
    ];

    return Scaffold(
      // body: Center(
      //   child: DefaultButton(
      //     text: 'Cerrar sesion', 
      //     onPressed: () async { 
      //       await vm.logout();                                  
      //       Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
      //     }
      //   ),
      // ),
      body: currentTab[vm.currentIndex],
      bottomNavigationBar: HomeBottomBar(context, vm),
    );
  }
}