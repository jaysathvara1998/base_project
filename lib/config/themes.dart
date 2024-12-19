import 'package:base_project/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        brightness: Brightness.light,primary: AppColors.primaryColor),
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 96.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor, // Dark Gray
      ),
      displayMedium: TextStyle(
        fontSize: 60.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor, // Dark Gray
      ),
      displaySmall: TextStyle(
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor, // Dark Gray
      ),
      headlineMedium: TextStyle(
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor, // Dark Gray
      ),
      headlineSmall: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor, // Dark Gray
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor, // Dark Gray
      ),
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: AppColors.textColor, // Dark Gray
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: AppColors.textColor, // Dark Gray
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: AppColors.contentSecondaryColor, // Medium Gray
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: AppColors.accentColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.contentTertiaryColor),
        // Light Gray
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.borderColor),
        // Dark Gray
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.contentTertiaryColor),
        // Light Gray
        borderRadius: BorderRadius.circular(8.0),
      ),
      labelStyle: const TextStyle(color: AppColors.textColor), // Dark Gray
    ),
    // ... other theme properties
  );
}