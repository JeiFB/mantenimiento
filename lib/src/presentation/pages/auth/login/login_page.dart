import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/injection.dart';
import 'package:flutter_gamer_mvvm/main.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/widgets/login_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginViewModel vm = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Stack(
        children: [
          StreamBuilder(
              stream: vm.response,
              builder: (context, snapshot) {
                final response = snapshot.data;
                if (response is Loading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (response is Error) {
                  final data = response as Error;
                  Fluttertoast.showToast(
                      msg: 'Error: ${data.error}',
                      toastLength: Toast.LENGTH_LONG,
                      timeInSecForIosWeb: 3);
                } else if (response is Success) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(locator<AuthUseCases>()),
                        ),
                        (route) => false);
                  });
                }
                return Container();
              }),
          LoginContent(vm)
        ],
      ),
    );
  }
}
