import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemeData {
  const AppThemeData._();

  static ThemeData get light {
    return ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
      textTheme: TextTheme(
        bodyText2: GoogleFonts.poppins(),
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
