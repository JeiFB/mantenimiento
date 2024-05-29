import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer_mvvm/injection.dart';
import 'package:flutter_gamer_mvvm/main.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_button.dart';
import 'package:provider/provider.dart';

class ProfileInfoContent extends StatelessWidget {
  UserData userData;
  ProfileInfoViewModel vm;

  ProfileInfoContent(this.vm, this.userData);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: DiagonalPathClipperTwo(),
              child: Image.asset(
                'assets/img/mantenimiento.jpg',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black38,
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 80),
                  width: double.infinity,
                  child: Text(
                    'Perfil de usuario',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: userData.image.isNotEmpty
                      ? NetworkImage(userData.image)
                      : AssetImage(
                          'assets/img/user_image.png',
                        ) as ImageProvider,
                )
              ],
            )
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Text(
            userData.username,
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5),
          child: Text(
            userData.email,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 40),
          child: DefaultButton(
            onPressed: () {
              Navigator.pushNamed(context, 'profile/update',
                  arguments: userData);
            },
            text: 'Editar datos',
            icon: Icons.edit,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 50),
          child: DefaultButton(
            text: 'Cerrar sesion',
            onPressed: () async {
              await vm.logout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(locator<AuthUseCases>()),
                  ),
                  (route) => false);
            },
            icon: Icons.power_settings_new,
          ),
        ),
      ],
    );
  }
}
