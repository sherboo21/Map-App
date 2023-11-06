import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/theme/app_textStyle.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight? textWeight;
  final TextAlign? textAlign;
  final double? textSize;
  final Color? textColor;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const AppText(
      {Key? key,
      required this.text,
      this.textAlign,
      this.textSize,
      this.textWeight,
      this.textColor,
      this.maxLines,
      this.textOverflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: textOverflow,
      style: AppTextStyle(
        textWeight: textWeight ?? FontWeight.w400,
        textSize: textSize ?? 14.sp,
        textColor: textColor ?? Colors.black,
      ),
    );
  }
}
