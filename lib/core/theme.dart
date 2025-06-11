// lib/core/theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:happy_hub/core/constants.dart';

final hhTheme = ThemeData(
  scaffoldBackgroundColor: HHColors.orange,
  colorScheme: ColorScheme.fromSeed(
    seedColor: HHColors.orange,
  ).copyWith(primary: HHColors.orange, secondary: HHColors.yellow),
  textTheme: GoogleFonts.rubikTextTheme().apply(
    bodyColor: HHColors.yellow,
    displayColor: HHColors.yellow,
  ),
  useMaterial3: true,
);
