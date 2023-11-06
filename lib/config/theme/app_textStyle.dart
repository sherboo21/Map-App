import 'package:flutter/material.dart';
class AppTextStyle extends TextStyle {
  final double textSize;
  final Color textColor;
  final FontWeight textWeight;

  const AppTextStyle(
      {required this.textColor,
      required this.textSize,
      required this.textWeight});

  @override
  double get fontSize => textSize;

  @override
  Color get color => textColor;

  @override
  FontWeight get fontWeight => textWeight;
}
