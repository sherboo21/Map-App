import 'package:flutter/material.dart';
import 'package:flutter_map/config/router/named_router.dart';
import 'package:flutter_map/config/router/named_router_impl.dart';
import 'package:flutter_map/presentation/screens/layout/home/components/home_item.dart';
import 'components/home_imports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 120.h,
          flexibleSpace: const HomeAppBar()),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>NamedNavigatorImpl().push(Routes.videoPlayerRouter),
        backgroundColor: AppColors.mainAppColor,
        child: const Icon(
          Icons.play_arrow,
          color: Colors.white,
          size: 30,
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        itemCount: 5,
        itemBuilder: (context, index) => HomeItem(index: index,),
        separatorBuilder: (context, index) => AppSize.h12.ph,
      ),
    );
  }
}
