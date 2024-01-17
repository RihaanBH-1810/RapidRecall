import 'package:flutter/material.dart';
import 'package:flutter_application_1/configs/constants.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
    primaryColor: blu,
    textTheme: TextTheme(
        bodyMedium: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.notoSans().fontFamily)),
    appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.notoSans().fontFamily,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black)));
