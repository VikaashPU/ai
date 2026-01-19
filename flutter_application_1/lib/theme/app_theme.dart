import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF4FC3F7);
  static const Color neonBlue   = Color(0xFF00E5FF);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    // ⭐ MOST IMPORTANT — NO BACKGROUND PAINT
    scaffoldBackgroundColor: Colors.transparent,
    canvasColor: Colors.transparent,
    cardColor: Colors.transparent,
    dialogBackgroundColor: Colors.transparent,

    // ⭐ COLOR SCHEME MUST ALSO BE TRANSPARENT
    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: neonBlue,
      surface: Colors.transparent,
      background: Colors.transparent,
    ),

    // ⭐ DO NOT LET INPUTS PAINT
    inputDecorationTheme: const InputDecorationTheme(
      filled: false,
      hintStyle: TextStyle(color: Colors.white54),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        borderSide: BorderSide.none,
      ),
    ),

    // ✅ BUTTONS CAN KEEP COLOR (THEY SHOULD NOT BE GLASS)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: primaryBlue,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),

    // ✅ TEXT IS SAFE
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.white70,
      ),
    ),

    // ⭐ IMPORTANT FOR FLUTTER 3.10+
    useMaterial3: true,
  );
}
