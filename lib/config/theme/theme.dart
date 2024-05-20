import 'package:flutter/material.dart';
import 'package:news4u/config/theme/text_theme.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF4F4F4),  // Lighter surface for better contrast
    background: Color(0xFFFFFFFF), // Slightly lighter background
    primary: Color(0xFFFB5A55),  // Calming and trustworthy blue
    secondary: Color(0xFFF3EED9), // Lighter shade of primary
    tertiary: Color(0xFFA7E17D),  // Vibrant green for variety
    onSurface: Color(0xFFDDDDDD), // Dark text on surfaces
    onBackground: Color(0xFF121212), // Dark text on background
    onPrimary: Color(0xFFFFFDFD), // Light text on primary
    onSecondary: Color(0xFFFFFDFD), // Light text on secondary
    onTertiary: Color(0xFFFFFDFD), // Light text on tertiary
    errorContainer: Color(0xFFEC3F78), // Error box / container
    onError: Color(0xFFFFFFFF),       // Text on Error container
  ),
  useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: Color(0xFFFB5A55), // Primary color for selected items
    unselectedItemColor: Color(0xFFDDDDDD),
    selectedIconTheme: IconThemeData(color: Color(0xFFFB5A55)),
    unselectedIconTheme: IconThemeData(color: Color(0xFFDDDDDD)),
    selectedLabelStyle: TextStyle(color: Color(0xFFFB5A55)),
    unselectedLabelStyle: TextStyle(color: Color(0xFFDDDDDD)),
  ),
  textTheme: textTheme,
);

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF121212), // any surface above background
    background: Color(0xFF000000), // background color
    primary: Color(0xFFFB5A55), // primary buttons etc
    secondary: Color(0xFFF3EED9), // dulled primary
    tertiary: Color(0xFFA7E17D), // secondary buttons
    onSurface: Color(0xFF1E1E1E), // On Surface title
    onBackground: Color(0xFFF3F3F3), // on Background title
    onPrimary: Color(0xFF121212), // Text on primary
    onSecondary: Color(0xFF121212), // text on secondary
    onTertiary: Color(0xFF121212), // text on tertiary
    errorContainer: Color(0xFFEC3F78), // error box / container
    onError: Color(0xFFFFFFFF), // Text on Error container
  ),
  useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    // backgroundColor: Color(value),
    showSelectedLabels: true,
    showUnselectedLabels: true,
    selectedItemColor: Color(0xFFFB5A55),
    unselectedItemColor: Color(0xFF1E1E1E),
    selectedIconTheme: IconThemeData(color: Color(0xFFFB5A55)),
    unselectedIconTheme: IconThemeData(color: Color(0xFF1E1E1E)),
    selectedLabelStyle: TextStyle(color: Color(0xFFFB5A55)),
    unselectedLabelStyle: TextStyle(color: Color(0xFF1E1E1E)),
  ),
  textTheme: textTheme,
);



/*
Light
primary - FB5A55
surface - F4F4F4
background - FFFFFF
onSurface - DDDDDD

Dark
primary - FB5A55
Surface - 121212
background - 000000
onSurface - 1E1E1E
onBackground - F3F3F3

*/