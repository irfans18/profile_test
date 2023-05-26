import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = const Color(0xff002984);
Color secondaryColor = const Color(0xffE0E0E0);
Color buttonColor = const Color(0xff006C84);
Color backgroundColor = const Color(0xffFFFFFF);
Color outBackgroundColor = const Color(0xff212121);

double horizontalMargin = 17;
double verticalMargin = 16;
double defaultWidth = 375;

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w900;

const double xSmallFs = 10;
const double smallFs = 12;
const double baseFs = 14;
const double mediumFs = 16;
const double largeFs = 18;
const double titleFs = 24;

TextStyle primaryTextStyle = GoogleFonts.nunito(fontWeight: bold, fontSize: smallFs);
TextStyle secondaryTextStyle = GoogleFonts.nunito(fontWeight: regular, fontSize: smallFs);
TextStyle titleTextStyle = GoogleFonts.nunito(fontWeight: bold, fontSize: titleFs, color: backgroundColor);

BoxShadow shadow = const BoxShadow(
  color: Color.fromRGBO(0, 41, 132, 0.25),
  blurRadius: 8,
  offset: Offset(4, 4),
);
