import 'package:flutter/material.dart';
import '../utils/app_imports.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await DioHelper.init();
  Bloc.observer = MyBlocObserver();
  return runApp(const FlutterMap());
}
