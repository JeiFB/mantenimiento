import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/injection.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/posts_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/users/users_usecases.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/register/register_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/register/register_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/home/home_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/home/home_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/posts_create_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/posts_create_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/detail/posts_detail_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/detail/posts_detail_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/list/posts_list_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/my_list/posts_my_list_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/update/posts_update_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/update/posts_update_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/update/profile_update_page.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/update/profile_update_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependecies();
  runApp(MyApp(locator<AuthUseCases>()));
}

class MyApp extends StatelessWidget {
  AuthUseCases _authUseCases;
  MyApp(this._authUseCases);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    String idSession = _authUseCases.getUser.userSession?.uid ?? '';
    print('Id session: ${idSession}');
    return MultiProvider(
      key: Key(idSession),
      providers: [
        ChangeNotifierProvider(
            create: (context) => LoginViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) => RegisterViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) => HomeViewModel(locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) => ProfileInfoViewModel(
                locator<UsersUseCase>(), locator<AuthUseCases>())),
        ChangeNotifierProvider(
            create: (context) =>
                ProfileUpdateViewModel(locator<UsersUseCase>())),
        ChangeNotifierProvider(
            create: (context) => PostsCreateViewModel(
                locator<AuthUseCases>(), locator<PostsUseCases>())),
        ChangeNotifierProvider(
            create: (context) => PostsListViewModel(locator<AuthUseCases>(),
                locator<PostsUseCases>(), locator<UsersUseCase>())),
        ChangeNotifierProvider(
            create: (context) => PostsDetailViewModel(
                locator<PostsUseCases>(), locator<UsersUseCase>())),
        ChangeNotifierProvider(
            create: (context) => PostsMyListViewModel(
                locator<AuthUseCases>(), locator<PostsUseCases>())),
        ChangeNotifierProvider(
            create: (context) => PostsUpdateViewModel(
                locator<AuthUseCases>(), locator<PostsUseCases>())),
      ],
      child: MaterialApp(
        title: 'Mantenimiento',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: idSession.isEmpty ? 'login' : 'home',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'home': (BuildContext context) => HomePage(),
          'profile/update': (BuildContext context) => ProfileUpdatePage(),
          'posts/create': (BuildContext context) => PostsCreatePage(),
          'posts/detail': (BuildContext context) => PostsDetailPage(),
          'posts/update': (BuildContext context) => PostsUpdatePage(),
        },
      ),
    );
  }
}
