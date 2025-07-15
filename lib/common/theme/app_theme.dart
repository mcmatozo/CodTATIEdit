import 'package:flutter/material.dart';

class FranceColors {
  static const Color blue = Color(0xFF0055A4);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = Color(0xFFEF4135);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color darkGray = Color(0xFF1C1C1C);
}

// Light Theme
final ThemeData appLightTheme = _buildTheme(Brightness.light);

// Dark Theme
final ThemeData appDarkTheme = _buildTheme(Brightness.dark);

// Função que monta os dois temas
ThemeData _buildTheme(Brightness brightness) {
  final bool isDark = brightness == Brightness.dark;

  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: FranceColors.blue,
    brightness: brightness,
    secondary: FranceColors.red,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor:
        isDark ? FranceColors.darkGray : FranceColors.lightGray,
    appBarTheme: AppBarTheme(
      backgroundColor: FranceColors.blue,
      foregroundColor: FranceColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: FranceColors.white,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: isDark ? const Color(0xFF2C2C2C) : Colors.white,
      margin: const EdgeInsets.all(12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: FranceColors.red,
        foregroundColor: FranceColors.white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: FranceColors.blue,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: isDark ? Colors.grey[800] : Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      hintStyle: TextStyle(
        color: isDark ? Colors.grey[400] : Colors.grey[700],
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: colorScheme.onBackground,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: colorScheme.onBackground,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: colorScheme.onBackground,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: colorScheme.onBackground,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}



// ThemeData appTheme([bool isDarkMode=false]) {
//   return isDarkMode ? franceDarkTheme : franceLightTheme;
// }