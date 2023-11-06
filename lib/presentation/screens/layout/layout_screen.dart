import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/presentation/screens/layout/home/home_screen.dart';
import '../../stateManagement/cubit/app_bottom_nav_cubit.dart';
import '../../widgets/custom_bottom_nav_bar.dart';

class LayOutScreen extends StatefulWidget {
  const LayOutScreen({Key? key}) : super(key: key);
  @override
  State<LayOutScreen> createState() => _LayOutScreenState();
}
class _LayOutScreenState extends State<LayOutScreen> {
  var pages = [];
  @override
  void initState() {
    super.initState();
    pages = [
      const HomeScreen(),
      const SizedBox(),
      const SizedBox(),
      const SizedBox()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBottomNavCubit, int>(
      builder: (context, state) {
        var appBottomNavCubit = context.read<AppBottomNavCubit>();
        return Scaffold(
            bottomNavigationBar: CustomBottomNavBar(state: state, appCubit: appBottomNavCubit),
            body: pages[state]);
      },
    );
  }
}
