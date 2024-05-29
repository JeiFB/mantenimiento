import 'package:flutter_gamer_mvvm/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependecies() async => await locator.init();