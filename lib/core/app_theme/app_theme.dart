import 'package:flutter/material.dart';

import '../app_colors/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      actionsIconTheme: IconThemeData(color: AppColors.primaryTextColor),
      titleTextStyle: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
        fontFamily: AppColors.fontFamily,
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: AppColors.primaryTextColor,
        fontFamily: AppColors.fontFamily,
      ),
      titleMedium: TextStyle(
        color: Color(0xFF878787),
        fontSize: 16,
        fontWeight: FontWeight.w500,
        fontFamily: AppColors.fontFamily,
      ),
      titleSmall: TextStyle(
        color: AppColors.greyColor,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        fontFamily: AppColors.fontFamily,
      ),
    ),
  );
}
