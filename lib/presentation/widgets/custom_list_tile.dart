import 'package:flutter/material.dart';

import '../../config/theme/app_colors.dart';
import 'custom_text.dart';
class CustomListTile extends StatelessWidget {
  final IconData iconData;
  final String title,subTitle;
  final Color color;
  const CustomListTile({Key? key, required this.iconData, required this.title, required this.subTitle, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Flexible(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(
          iconData,
          color: color,
        ),
        title: AppText(
          text: title
        ),
        subtitle: AppText(
          text: subTitle,
          textColor: AppColors.mainAppColor,
        ),
      ),
    );
  }
}
