import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightThemeData => ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade50,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        dividerColor: Colors.grey.shade400,
        brightness: Brightness.light,
      );
}
