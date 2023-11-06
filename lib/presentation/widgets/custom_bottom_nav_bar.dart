import 'package:flutter/material.dart';
import '../../config/theme/app_colors.dart';
import '../../utils/app_size.dart';
import '../stateManagement/cubit/app_bottom_nav_cubit.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int state;
  final AppBottomNavCubit appCubit;
  const CustomBottomNavBar(
      {Key? key, required this.state, required this.appCubit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: AppSize.h70,
      backgroundColor: AppColors.mainAppColor,
      color: Colors.white,
      buttonBackgroundColor: Colors.white,
      onTap: (index) => appCubit.updateIndex(index),
      index: state,
      letIndexChange: (index) => true,
      animationDuration: const Duration(milliseconds: 0),
      items: const [
        Icon(Icons.home_outlined, size: 40),
        Icon(Icons.settings_backup_restore_outlined, size: 40),
        Icon(Icons.error_outline, size: 40),
        Icon(Icons.settings, size: 40),
      ],
    );
  }
}
