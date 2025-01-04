import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kThemeModeKey = '__theme_mode__';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFF19DB8A),
  scaffoldBackgroundColor: const Color(0xFFF1F4F8),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF19DB8A),
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.outfit(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.normal,
      fontSize: 64.0,
    ),
    displayMedium: GoogleFonts.outfit(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.normal,
      fontSize: 44.0,
    ),
    displaySmall: GoogleFonts.outfit(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.w600,
      fontSize: 36.0,
    ),
    headlineLarge: GoogleFonts.outfit(
      color: const Color(0xFF19DB8A),
      fontWeight: FontWeight.w600,
      fontSize: 32.0,
    ),
    headlineMedium: GoogleFonts.outfit(
      color: const Color(0xFF19DB8A),
      fontWeight: FontWeight.normal,
      fontSize: 24.0,
    ),
    headlineSmall: GoogleFonts.outfit(
      color: const Color(0xFF19DB8A),
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
    ),
    titleLarge: GoogleFonts.outfit(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
    ),
    titleMedium: GoogleFonts.readexPro(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.normal,
      fontSize: 18.0,
    ),
    titleSmall: GoogleFonts.readexPro(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
    labelLarge: GoogleFonts.readexPro(
      color: const Color(0xFF57636C),
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
    ),
    labelMedium: GoogleFonts.readexPro(
      color: const Color(0xFF57636C),
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
    ),
    labelSmall: GoogleFonts.readexPro(
      color: const Color(0xFF57636C),
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
    ),
    bodyLarge: GoogleFonts.readexPro(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
    ),
    bodyMedium: GoogleFonts.readexPro(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
    ),
    bodySmall: GoogleFonts.readexPro(
      color: const Color(0xFF14181B),
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
    ),
  ),
  colorScheme: const ColorScheme.light(
      primary: Color(0xFF19DB8A),
      secondary: Color(0xFF36B4FF),
      tertiary: Color.fromARGB(255, 255, 0, 0),
      surface: Color(0xFFFFFFFF),
      error: Color(0xFFFF5963),
      onPrimary: Color(0xFF14181B),
      onSecondary: Colors.white,
      onSurface: Color(0xFF14181B),
      onError: Colors.white,
      primaryContainer: Colors.white,
      secondaryContainer: Color.fromARGB(255, 219, 219, 219),
      shadow: Colors.grey
      // Primary background for light theme
      ),
  iconTheme: const IconThemeData(
    color: Colors.black, // Default icon color
    size: 24.0, // Default icon size
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFF19DB8A),
  scaffoldBackgroundColor: const Color(0xFF1D2428),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF19DB8A),
    textTheme: ButtonTextTheme.primary,
  ),
  textTheme: TextTheme(
    displayLarge: GoogleFonts.outfit(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 64.0,
    ),
    displayMedium: GoogleFonts.outfit(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 44.0,
    ),
    displaySmall: GoogleFonts.outfit(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 36.0,
    ),
    headlineLarge: GoogleFonts.outfit(
      color: const Color(0xFF19DB8A),
      fontWeight: FontWeight.w600,
      fontSize: 32.0,
    ),
    headlineMedium: GoogleFonts.outfit(
      color: const Color(0xFF19DB8A),
      fontWeight: FontWeight.normal,
      fontSize: 24.0,
    ),
    headlineSmall: GoogleFonts.outfit(
      color: const Color(0xFF19DB8A),
      fontWeight: FontWeight.w500,
      fontSize: 24.0,
    ),
    titleLarge: GoogleFonts.outfit(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
    ),
    titleMedium: GoogleFonts.readexPro(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 18.0,
    ),
    titleSmall: GoogleFonts.readexPro(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
    labelLarge: GoogleFonts.readexPro(
      color: const Color(0xFF95A1AC),
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
    ),
    labelMedium: GoogleFonts.readexPro(
      color: const Color(0xFF95A1AC),
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
    ),
    labelSmall: GoogleFonts.readexPro(
      color: const Color(0xFF95A1AC),
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
    ),
    bodyLarge: GoogleFonts.readexPro(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 16.0,
    ),
    bodyMedium: GoogleFonts.readexPro(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 14.0,
    ),
    bodySmall: GoogleFonts.readexPro(
      color: Colors.white,
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF19DB8A),
    secondary: Color(0xFF36B4FF),
    tertiary: Color.fromARGB(255, 255, 0, 0),
    surface: Color(0xFF262D34),
    error: Color(0xFFFF5963),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
    onError: Colors.white, // Primary background for dark theme
    primaryContainer: Color.fromARGB(255, 20, 20, 28),
    secondaryContainer: Colors.grey,
    shadow: Colors.black,
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 255, 255, 255), // Default icon color
    size: 24.0, // Default icon size
  ),
);
