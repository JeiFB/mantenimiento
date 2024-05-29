import 'package:flutter/material.dart';

class LoginTextFieldDescription extends StatelessWidget {
  const LoginTextFieldDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 15),
      child: Text(
        'Continua con tu',
        style: TextStyle(
          fontSize: 24,
          color: Colors.white
        ),
      ),
    );
  }
}