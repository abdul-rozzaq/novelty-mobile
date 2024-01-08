import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,
  hoverColor: Colors.transparent,
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent, primary: Colors.blueAccent),
  fontFamily: GoogleFonts.ubuntu().fontFamily,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.blueAccent,
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: GoogleFonts.ubuntu(fontSize: 18),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
);
