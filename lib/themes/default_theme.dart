import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTheme {
  // Default Color Settings
  // static const Color primaryColor = Color(0xFFEACB64);
  static const Color primaryColor = Colors.blue;
  static const Color primaryInverseColor = Color(0xFF4E432F);
  static const Color onSurfaceColor = Color(0xFF72CCE8);
  static const Color onSurfaceVariant = Color(0xFFFF6578);
  static const Color onPrimaryColor = Color(0xFFA5E179);
  static const Color surfaceColor = Color(0xFF4E432F);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color onSecondaryColor = Color(0xFFE1E3E4);
  static const Color onBackgroundColor = Color(0xFF828A9A);
  static const Color secondaryColor = Color(0xFF55393D);
  static const Color primaryContainer = Color(0xFF394634);
  static const Color errorColor = Color(0xFFF69C5E);
  static const Color onErrorColor = Color(0xFF354157);

  // Padding
  static const EdgeInsets outerPadding = EdgeInsets.all(30.0);
  static const EdgeInsets normalPadding = EdgeInsets.all(20.0);
  static const EdgeInsets screenMargin = EdgeInsets.all(8.0);
  static const EdgeInsets formFieldPadding = EdgeInsets.only(bottom: 20.0);

  // Image Paths
  static const String logoImage = 'assets/images/qrail_logo.png';

  // Media Query
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // Button Style
  static final ButtonStyle fullWidthPrimaryButton = ElevatedButton.styleFrom(
    minimumSize: const Size(double.infinity, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  );
  static final ButtonStyle fullWidthSecondaryButton = ElevatedButton.styleFrom(
    backgroundColor: Colors.white70,
    foregroundColor: Colors.blue,
    minimumSize: const Size(double.infinity, 60),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50.0),
    ),
  );

  static final ThemeData darkBlueTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    fontFamily: GoogleFonts.poppins().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          Colors.white,
        ),
        backgroundColor: WidgetStateProperty.all(
          Colors.blueGrey,
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.0),
        borderSide: BorderSide(
          color: Color.alphaBlend(Colors.black, Colors.white),
          style: BorderStyle.solid,
        ),
      ),
    ),
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: primaryColor,
      background: backgroundColor,
      primary: primaryColor,
      secondary: secondaryColor,
      inversePrimary: primaryInverseColor,
      onSurface: onSurfaceColor,
      surface: surfaceColor,
      onSurfaceVariant: onSurfaceVariant,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onBackground: onBackgroundColor,
      primaryContainer: primaryContainer,
      error: errorColor,
      onError: onErrorColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: primaryColor,
      background: backgroundColor,
      primary: primaryColor,
      secondary: secondaryColor,
      inversePrimary: primaryInverseColor,
      onSurface: onSurfaceColor,
      surface: surfaceColor,
      onSurfaceVariant: onSurfaceVariant,
      onPrimary: onPrimaryColor,
      onSecondary: onSecondaryColor,
      onBackground: onBackgroundColor,
      primaryContainer: primaryContainer,
      error: errorColor,
      onError: onErrorColor,
    ),
  );
}
