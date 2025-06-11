import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

final hhTheme = ThemeData(
  scaffoldBackgroundColor: const Color(HHColors.orange),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(HHColors.orange))
      .copyWith(
        primary: const Color(HHColors.orange),
        secondary: const Color(HHColors.yellow),
      ),
  textTheme: GoogleFonts.rubikTextTheme().apply(
    bodyColor: const Color(HHColors.yellow),
    displayColor: const Color(HHColors.yellow),
  ),
  useMaterial3: true,
);
