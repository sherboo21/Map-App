import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavCubit extends Cubit<int> {
  AppBottomNavCubit() : super(0);

  /// update index function to update the index onTap in BottomNavigationBar //

  void updateIndex(int index) => emit(index);

  /// for navigation button on single page //

  void getHome() => emit(0);

  void getPage2() => emit(1);

  void getPage3() => emit(2);

  void getPage4() => emit(3);
}
