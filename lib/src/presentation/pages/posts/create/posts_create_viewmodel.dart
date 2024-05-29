import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/posts/posts_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/posts/create/posts_create_state.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';
import 'package:image_picker/image_picker.dart';

class PostsCreateViewModel extends ChangeNotifier {

  PostsCreateState _state = PostsCreateState();
  PostsCreateState get state => _state;

  File? _imageFile;
  File? get imageFile => _imageFile;

  AuthUseCases _authUseCases;
  PostsUseCases _postsUseCases;

  Resource _response = Init();
  Resource get response => _response;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  PostsCreateViewModel(this._authUseCases, this._postsUseCases) {
    _state = _state.copyWith(idUser: _authUseCases.getUser.userSession?.uid ?? '');
  }

  createPost() async {
    if (_state.isValid()) {
      print('FORMULARIO VALIDO');
      _response = Loading();
      notifyListeners();
      _response = await _postsUseCases.create.launch(_state.toPost(), _state.image!);
      notifyListeners();
    }
    else {
      _state = _state.copyWith(error: 'Debes completar todos los campos');
      print('FORMULARIO NO VALIDO');
      notifyListeners();
    }
  }

  changeName(String value) {
    if (value.length >= 3) {
      _state = _state.copyWith(name: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(name: ValidationItem(error: 'Al menos 3 caracteres'));
    }
    notifyListeners();
  }

  changeDescription(String value) {
    if (value.length >= 6) {
      _state = _state.copyWith(description: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(description: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

  changeRadioCategory(String value) {
    _state = _state.copyWith(category: value);
    print('Radio: ${_state.category}');
    notifyListeners();
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();    
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = File(image.path);
      _state = _state.copyWith(image: _imageFile);
      notifyListeners();
    }
  }

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();    
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _imageFile = File(image.path);
      _state = _state.copyWith(image: _imageFile);
      notifyListeners();
    }
  }

  resetResponse() {
    _response = Init();    
    notifyListeners();
  }

  resetState() {
    _state = PostsCreateState();
    nameController.clear();
    descriptionController.clear();
    notifyListeners();
  }

}