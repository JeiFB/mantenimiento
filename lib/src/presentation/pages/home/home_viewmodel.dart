import 'package:flutter/foundation.dart';
import 'package:flutter_gamer_mvvm/src/domain/use_cases/auth/auth_usecases.dart';

class HomeViewModel extends ChangeNotifier {

  AuthUseCases _authUseCases;
  
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;


  HomeViewModel(this._authUseCases);

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

}