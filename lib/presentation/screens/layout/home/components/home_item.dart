import 'package:flutter/material.dart';
import 'package:flutter_map/config/router/named_router.dart';
import 'package:flutter_map/config/router/named_router_impl.dart';
import 'package:flutter_map/presentation/screens/layout/home/components/home_imports.dart';

class HomeItem extends StatelessWidget {
  final int index ;
  const HomeItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>NamedNavigatorImpl().push(Routes.mapRouter),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: AppSize.w10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SvgPicture.asset(
                      AppIcons.egyptIcon,
                      fit: BoxFit.contain,
                      height: AppSize.h30,
                      width: AppSize.w30,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: AppStrings.ahmed,
                        ),
                        AppText(
                          text: AppStrings.cairoEgypt,
                          textColor: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Visibility(
                    visible: index == 1,
                    replacement: Flexible(
                      child: Container(
                        height: AppSize.h35,
                        width: AppSize.w35,
                        decoration: const BoxDecoration(
                            color: Colors.yellow, shape: BoxShape.circle),
                        child: Center(
                          child: AppText(
                            text: AppStrings.New,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    child: Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: AppStrings.lastVisit,
                            style: AppTextStyle(
                              textSize: 14.sp,
                              textWeight: FontWeight.w400,
                              textColor: Colors.black
                            ),
                            children: [
                              TextSpan(
                                text: '10Aug, 01:22:50',
                                style:AppTextStyle(
                                    textSize: 12.sp,
                                    textWeight: FontWeight.w400,
                                    textColor: AppColors.mainAppColor
                                ),
                              )
                            ]
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: SvgPicture.asset(
                      AppIcons.chatIcon,
                      fit: BoxFit.contain,
                      height: AppSize.h30,
                      width: AppSize.w30,
                      colorFilter: const ColorFilter.mode(
                          Colors.blue, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomListTile(
                      iconData: Icons.calendar_month,
                      color: AppColors.mainAppColor,
                      title: AppStrings.date,
                      subTitle: '15Aug, 01:32:55'),
                  CustomListTile(
                      iconData: Icons.location_on,
                      color: Colors.blue,
                      title: AppStrings.ip,
                      subTitle: '192.255.168.15'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomListTile(
                      iconData: Icons.calendar_today,
                      color: Colors.blue.shade900,
                      title: AppStrings.redirected,
                      subTitle: 'www.google.com'),
                  CustomListTile(
                      iconData: Icons.computer,
                      color: Colors.purple,
                      title: AppStrings.homePage,
                      subTitle: 'www.souq.com'),
                ],
              ),
            ],
          )),
    );
  }
}
