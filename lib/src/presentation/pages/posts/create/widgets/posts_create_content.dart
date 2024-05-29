import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/posts_create_viewmodel.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/widgets/posts_category.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/base_color.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/show_select_image_dialog.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_button.dart';
import 'package:flutter_gamer_mvvm/src/presentation/widgets/default_textfield.dart';

class PostsCreateContent extends StatelessWidget {
  final PostsCreateViewModel vm;

  const PostsCreateContent(this.vm);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.35,
                color: BASE_COLOR,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showSelectImageDialog(
                            context, vm.pickImage, vm.takePhoto);
                      },
                      child: vm.state.image != null
                          ? Image.file(
                              vm.state.image!,
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.35,
                              fit: BoxFit.cover,
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Image.asset(
                                    'assets/img/gallery.png',
                                    height: 150,
                                    width: 150,
                                  ),
                                ),
                                Text(
                                  'SELECCIONA UNA IMAGEN DE TU VEHICULO',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                    ),
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DefaultTextField(
                controller: vm.nameController,
                // initialValue: vm.state.name.value,
                label: 'Numero de placa',
                icon: Icons.numbers,
                error: vm.state.name.error,
                onChanged: (value) {
                  vm.changeName(value);
                }),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DefaultTextField(
                controller: vm.descriptionController,
                // initialValue: vm.state.description.value,
                label: 'Fecha de manteniminento',
                icon: Icons.calendar_month,
                error: vm.state.description.error,
                onChanged: (value) {
                  vm.changeDescription(value);
                }),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 15),
            child: Text(
              'HORARIOS',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Postscategory(
            value: '9:00 AM',
            groupValue: vm.state.category,
            onChanged: (value) {
              vm.changeRadioCategory(value);
            },
          ),
          Postscategory(
            value: '10:00 AM',
            groupValue: vm.state.category,
            onChanged: (value) {
              vm.changeRadioCategory(value);
            },
          ),
          Postscategory(
            value: '11:00 AM',
            groupValue: vm.state.category,
            onChanged: (value) {
              vm.changeRadioCategory(value);
            },
          ),
          Postscategory(
            value: '2:00 PM',
            groupValue: vm.state.category,
            onChanged: (value) {
              vm.changeRadioCategory(value);
            },
          ),
          Postscategory(
            value: '3:00 PM',
            groupValue: vm.state.category,
            onChanged: (value) {
              vm.changeRadioCategory(value);
            },
          ),
          Postscategory(
            value: '4:00 PM',
            groupValue: vm.state.category,
            onChanged: (value) {
              vm.changeRadioCategory(value);
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              vm.state.error,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: DefaultButton(
                text: 'APARTAR CUPO',
                onPressed: () {
                  vm.createPost();
                }),
          )
        ],
      ),
    );
  }
}
