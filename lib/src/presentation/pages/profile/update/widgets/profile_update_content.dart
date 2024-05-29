import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/update/profile_update_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/show_select_image_dialog.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_button.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_textfield.dart';

class ProfileUpdateContent extends StatefulWidget {

  ProfileUpdateViewModel vm;
  UserData userDataArg;

  ProfileUpdateContent(this.vm, this.userDataArg);

  
  @override
  State<ProfileUpdateContent> createState() => _ProfileUpdateContentState();
}

class _ProfileUpdateContentState extends State<ProfileUpdateContent> {

  @override
  void initState() {    
    widget.vm.loadData(widget.userDataArg); // UNA VEZ     
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    

    return Column(
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Image.asset(
                'assets/img/super_nintendo.jpg', 
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
                      fontWeight: FontWeight.bold
                    ),                  
                    textAlign: TextAlign.center,
                  ),
                ),                
                GestureDetector(
                  onTap: () {                    
                    showSelectImageDialog(
                      context,
                      widget.vm.pickImage,
                      widget.vm.takePhoto
                    );                                        
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: widget.vm.imageFile != null 
                    ? FileImage(widget.vm.imageFile!)
                    : widget.userDataArg.image.isNotEmpty 
                      ? NetworkImage(widget.userDataArg.image)
                      : AssetImage('assets/img/user_image.png') as ImageProvider,
                  ),
                ),                
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                )
              ),
            ),       
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 50),
          child: DefaultTextField(
            label: 'Nombre de usuario',
            initialValue: widget.vm.state.username.value,
            error: widget.vm.state.username.error,
            icon: Icons.person_2_outlined, 
            onChanged: (value) {
              widget.vm.changeUsername(value);              
            }
          ),
        ),
        Spacer(),        
        Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 50),
          child: DefaultButton(
            text: 'Actualizar informacion', 
            onPressed: () {
              widget.vm.update();
            },
            icon: Icons.edit,
          ),
        ),
        
      ],
    );
  }
}