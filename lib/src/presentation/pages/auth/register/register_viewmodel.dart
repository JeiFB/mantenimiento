import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/models/user_data.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/register/register_state.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';

class RegisterViewModel extends ChangeNotifier {

  // ESTADO
  RegisterState _state = RegisterState();
  RegisterState get state => _state;

  StreamController<Resource> _responseController = StreamController<Resource>();
  Stream<Resource> get response => _responseController.stream;

  // USE CASE
  AuthUseCases _authUseCases;

  RegisterViewModel(this._authUseCases);

  register() async {
    if (_state.isValid()) {      
      _responseController.add(Loading());       
      final data  = await _authUseCases.register.launch(_state.toUser()); // SUCCESS - ERROR
      _responseController.add(data);       
    }    
  }

  changeEmail(String value) {
    _responseController.add(Init());
    final bool emailFormatValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(email: ValidationItem(error: 'No es un email'));
    }
    else if (value.length >= 6) {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(email: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

  changeUsername(String value) {
    _responseController.add(Init());
    if (value.length >= 3) {
      _state = _state.copyWith(username: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(username: ValidationItem(error: 'Al menos 3 caracteres'));
    }
    notifyListeners();
  }

  changePassword(String value) {
    _responseController.add(Init());
    if (value.length >= 6) {
      _state = _state.copyWith(password: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(password: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

  changeConfirmPassword(String value) {
    _responseController.add(Init());
    if (value.length >= 6) {
      _state = _state.copyWith(confirmPassword: ValidationItem(value: value, error: ''));
    }
    else {
      _state = _state.copyWith(confirmPassword: ValidationItem(error: 'Al menos 6 caracteres'));
    }
    notifyListeners();
  }

}