import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/info/profile_info_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/info/widgets/profile_info_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class ProfileInfoPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    ProfileInfoViewModel vm = Provider.of<ProfileInfoViewModel>(context);

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      // body: ProfileContent()
      body: StreamBuilder(
        stream: vm.getUserById(),
        builder: ((context, snapshot) { // snapshot -> informacion
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }        
          if (!snapshot.hasData) {
            return Center(
              child: Text('No hay informacion'),
            );
          }
          final response = snapshot.data;
          if (response is Error) {
            final data = response as Error;
            return Center(
              child: Text('Error: ${data.error}'),
            );
          }
          final success = response as Success<UserData>;
          return ProfileInfoContent(vm, success.data);
        })
      ),      
    );
  }
}