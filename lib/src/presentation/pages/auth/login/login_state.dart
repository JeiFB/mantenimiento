import 'package:flutter_gamer_mvvm/src/presentation/utils/validation_item.dart';

class LoginState {

  ValidationItem email;
  ValidationItem password;

  LoginState({
    this.email = const ValidationItem(),
    this.password = const ValidationItem()
  });

  LoginState copyWith({
    ValidationItem? email, 
    ValidationItem? password
  }) => LoginState(
      email: email ?? this.email,
      password: password ?? this.password
  );

  bool isValid() {
    if (
      email.value.isEmpty || 
      email.error.isNotEmpty ||
      password.value.isEmpty ||
      password.error.isNotEmpty       
    ) {
      return false;
    }
    return true;
  }

}