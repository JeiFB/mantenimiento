import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_button.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_textfield.dart';
import 'package:provider/provider.dart';

class RegisterContent extends StatelessWidget {
  final RegisterViewModel vm;
  const RegisterContent(this.vm);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.27,
                color: BASE_COLOR,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(top: 50, left: 15),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 32,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/img/car.png',
                          height: 100,
                          width: 150,
                        ),
                        Text(
                          'Mantenimiento App',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Text(
              'Continua con tu',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Registro',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          // Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextField(
              onChanged: (value) {
                vm.changeUsername(value);
              },
              error: vm.state.username.error,
              label: 'Nombre de usuario',
              icon: Icons.person_outline,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextField(
              onChanged: (value) {
                vm.changeEmail(value);
              },
              error: vm.state.email.error,
              label: 'Correo electronico',
              icon: Icons.email_outlined,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextField(
              onChanged: (value) {
                vm.changePassword(value);
              },
              error: vm.state.password.error,
              label: 'Contrasena',
              icon: Icons.lock_outline,
              obscureText: true,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: DefaultTextField(
              onChanged: (value) {
                vm.changeConfirmPassword(value);
              },
              error: vm.state.confirmPassword.error,
              label: 'Confirmar constrasena',
              obscureText: true,
              icon: Icons.lock_outline_rounded,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: 15, left: 15, bottom: 40, top: 15),
            child: DefaultButton(
                text: 'Registrarse',
                onPressed: () {
                  vm.register();
                }),
          )
        ],
      ),
    );
  }
}
