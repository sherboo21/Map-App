import 'package:flutter/material.dart';
import 'package:flutter_map/presentation/screens/layout/home/components/home_imports.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.mainAppColor,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30))),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 150.w,
                height: 90.h,
                decoration: BoxDecoration(
                    color: AppColors.leftCurve,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(75),
                        bottomLeft: Radius.circular(70))),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 150.w,
                height: 90.h,
                decoration: BoxDecoration(
                    color: AppColors.rightCurve,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(75),
                        bottomLeft: Radius.circular(70))),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 180.w,
                height: 70.h,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(150),
                        topLeft: Radius.circular(150))),
              ),
            ),
            Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    leading: Image.asset(
                      AppIcons.icon,
                      height: AppSize.h70,
                      width: AppSize.w70,
                      fit: BoxFit.contain,
                    ),
                    title: TextField(
                      cursorColor: AppColors.mainAppColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(5),
                        filled: true,
                        fillColor: Colors.white,

                        hintText: AppStrings.search,
                        hintStyle: AppTextStyle(
                            textColor: AppColors.mainAppColor,
                            textWeight: FontWeight.w400,
                            textSize: 20.sp
                        ),
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none
                        ),
                        suffixIcon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: AppColors.mainAppColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8))
                          ),
                          child: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Column(
                      children: [
                        const Icon(
                          Icons.volume_off,
                          color: Colors.white,
                        ),
                        AppText(
                          text: AppStrings.umMute,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                    trailing: Column(
                      children: [
                        AppText(
                          text: AppStrings.visitors,
                          textColor: Colors.white,
                        ),
                        const AppText(
                          text: '270000',
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  )
                ],
              ).addOnlyPadding(tVal: AppSize.h10),
            )
          ],
        ));
  }
}
