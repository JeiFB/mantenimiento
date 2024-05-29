import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';
import 'package:flutter_gamer_mvvm/src/domain/utils/resource.dart';
import 'package:flutter_gamer_mvvm/src/presentation/pages/auth/login/login_state.dart';
import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginViewModel extends ChangeNotifier {

  // STATES
  LoginState _state = LoginState();
  
  StreamController<Resource> _responseController = StreamController<Resource>();
  Stream<Resource> get response => _responseController.stream;

  // GETTERS
  LoginState get state => _state;
  

  // USE CASES
  AuthUseCases _authUseCases;

  LoginViewModel(this._authUseCases);

  login() async {
    if (state.isValid()) {   
      _responseController.add(Loading());       
      final data  = await _authUseCases.login.launch(
        email: _state.email.value,
        password: _state.password.value
      ); // SUCCESS - ERROR
      _responseController.add(data);                 
    }
  }

  // SETTERS
  changeEmail(String value) {
    _responseController.add(Init());
    final bool emailFormatValid = 
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);

    if (!emailFormatValid) {
      _state = _state.copyWith(email: ValidationItem(error: 'No es un email'));
    }
    else if (value.length >= 6 ) {
      _state = _state.copyWith(email: ValidationItem(value: value, error: ''));
    }    
    else {
      _state = _state.copyWith(email: ValidationItem(error: 'Al menos 6 caracteres'));
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

}