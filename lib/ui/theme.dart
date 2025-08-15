import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xff4682B4);
  static const Color secondaryColor = Color(0xffE0FFFF);
  static const Color accentColor = Color(0xffF0FFF0);
  static const Color surfaceColor = Color(0xffF5FFFA);
  static const Color backgroundColor = Color(0xffFFFAFA);
  static const Color errorColor = Color(0xffB22222);
  static const Color sucessColor = Color(0xff3CB371);
  static const Color warningColor = Color(0xffFF0000);
  static const Color loadingColor = Color(0xffFFFFFF);

  AppTheme._();
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: accentColor,
        surface: surfaceColor,
        error: errorColor,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 2,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: primaryColor,
          elevation: 3,
          shadowColor: primaryColor.withValues(alpha: 0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey.withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: errorColor),
        ),
        labelStyle: TextStyle(color: primaryColor.withValues(alpha: 0.8)),
        hintStyle: TextStyle(color: Colors.grey.shade500),
        iconColor: primaryColor,
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D0B0A),
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0D0B0A),
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0D0B0A),
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0D0B0A),
        ),
        bodyLarge: TextStyle(fontSize: 16, color: Color(0xff0D0B0A)),
        bodyMedium: TextStyle(fontSize: 14, color: Color(0xff0D0B0A)),
      ),

      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: primaryColor.withValues(alpha: 0.2),
        circularTrackColor: loadingColor.withValues(alpha: 0.2),
      ),

      iconTheme: IconThemeData(color: primaryColor, size: 24),

      scaffoldBackgroundColor: backgroundColor,
    );
  }
}
