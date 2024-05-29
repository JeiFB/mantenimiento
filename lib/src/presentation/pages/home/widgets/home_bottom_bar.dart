import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/home/home_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';

class HomeBottomBar extends StatelessWidget {
  HomeViewModel vm;
  BuildContext context;

  HomeBottomBar(this.context, this.vm);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: BACKGROUND_COLOR,
        currentIndex: vm.currentIndex,
        fixedColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        onTap: (index) {
          vm.currentIndex = index;
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              label: 'Turnos'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list_alt,
                color: Colors.white,
              ),
              label: 'Mi Turno'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: 'Perfil'),
        ]);
  }
}
