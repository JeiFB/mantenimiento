import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/users/users_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/profile/update/profile_update_state.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';
import 'package:image_picker/image_picker.dart';

class ProfileUpdateViewModel extends ChangeNotifier {
  
  UsersUseCase _usersUseCase;

  ProfileUpdateState _state = ProfileUpdateState();
  ProfileUpdateState get state => _state;

  Resource _response = Init();
  Resource get response => _response;

  File? _imageFile;
  File? get imageFile => _imageFile;

  ProfileUpdateViewModel(this._usersUseCase);

  update() async {
    if (_state.isValid()) {
      _response = Loading();
      notifyListeners(); // DIALOG ESPERAR
      if (_imageFile == null) {
        _response = await _usersUseCase.updateWithoutImage.launch(_state.toUser());
      }
      else {
        _response = await _usersUseCase.updateWithImage.launch(_state.toUser(), _imageFile!);
      }    
      notifyListeners();
    }    
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();    
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();    
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _imageFile = File(image.path);
      notifyListeners();
    }
  }

  loadData(UserData userData) {
    print('Argumentos: ${userData.toJson()}');
    _state = _state.copyWith(
      id: ValidationItem(value: userData.id),
      username:  ValidationItem(value: userData.username),
      image:  ValidationItem(value: userData.image),
    );
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();  
    });    
  }

  changeUsername(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(username: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(username: ValidationItem(error: 'Al menos 3 caracteres'));
    }
    notifyListeners();
  }  

  resetResponse() {
    _response = Init();
    notifyListeners();
  }

}