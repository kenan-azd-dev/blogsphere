import 'package:flutter/material.dart';

// Project Files
import './colors.dart';

class AppTheme {
  static _border([Color color = AppColors.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(18.0),
      );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Lato',
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppColors.primaryOrange),
      errorBorder: _border(AppColors.errorColor),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Lato',
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppColors.primaryOrange),
      errorBorder: _border(AppColors.errorColor),
    ),
  );
}
