import 'package:announcements_app/utils/utils.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData lightTheme = ThemeData(
    primarySwatch: AppUtils.getMaterialColor(AppColors.primary),
    appBarTheme: const AppBarTheme(foregroundColor: Colors.white, elevation: 0, centerTitle: true)
  );
}