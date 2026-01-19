import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF4FC3F7);
  static const Color neonBlue = Color(0xFF00E5FF);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: Colors.transparent,
    cardColor: Colors.transparent,
    dialogBackgroundColor: Colors.transparent,

    // 🔹 Slightly tinted surfaces for depth (VERY subtle)
colorScheme: const ColorScheme.dark(
  primary: primaryBlue,
  secondary: neonBlue,

  // 🔹 ALLOW BACKGROUND TO SHOW THROUGH
  surface: Colors.transparent,
  background: Colors.transparent,
),

    // 🔹 ALLOW GLASS INPUT FILL
    inputDecorationTheme: const InputDecorationTheme(
      filled: true, // ← CHANGE THIS
      fillColor: Colors.transparent, // actual color comes from widget
      hintStyle: TextStyle(color: Colors.white54),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide.none,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primaryBlue,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),

    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    ),

    useMaterial3: true,
  );
}
