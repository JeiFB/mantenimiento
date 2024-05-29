import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_button.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_textfield.dart';

class LoginContent extends StatelessWidget {
  final LoginViewModel vm;

  const LoginContent(this.vm);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.32,
              color: BASE_COLOR,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/img/car.png',
                    height: 100,
                    width: 150,
                  ),
                  Text(
                    'Mantenimiento App',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, top: 15),
            child: Text(
              'Continua con tu',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          // Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: DefaultTextField(
              onChanged: (value) {
                vm.changePassword(value);
              },
              error: vm.state.password.error,
              obscureText: true,
              label: 'Contrasena',
              icon: Icons.lock_outline,
            ),
          ),
          Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              child: DefaultButton(
                onPressed: () {
                  vm.login();
                },
                text: 'Iniciar sesion',
              )),
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(bottom: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'register');
                },
                child: Text(
                  "No tienes cuenta?",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ))
        ],
      ),
    );
  }
}
