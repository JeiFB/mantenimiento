import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/update/profile_update_response.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/update/profile_update_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/update/widgets/profile_update_content.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:provider/provider.dart';

class ProfileUpdatePage extends StatelessWidget {
  const ProfileUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {

    ProfileUpdateViewModel vm = Provider.of<ProfileUpdateViewModel>(context);
    UserData userDataArg = ModalRoute.of(context)?.settings.arguments as UserData;        
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ProfileUpdateResponse(context, vm);  
    }); // CUANDO TODOS LOS ELEMENTOS YA HAN SIDO MOSTRADOS EN PANATALLAS    

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: ProfileUpdateContent(vm, userDataArg),
    );
  }
}