import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String poppins = 'Poppins';
double defaultMargin = 30.0;

Map<int, Color> color =
{
  50:Color.fromRGBO(30,194,139, .1),
  100:Color.fromRGBO(30,194,139, .2),
  200:Color.fromRGBO(30,194,139, .3),
  300:Color.fromRGBO(30,194,139, .4),
  400:Color.fromRGBO(30,194,139, .5),
  500:Color.fromRGBO(30,194,139, .6),
  600:Color.fromRGBO(30,194,139, .7),
  700:Color.fromRGBO(30,194,139, .8),
  800:Color.fromRGBO(30,194,139, .9),
  900:Color.fromRGBO(30,194,139, 1),
};
MaterialColor primaryThemeColor = MaterialColor(0xFF1EC28B, color);

class ExploriaTheme {
  static const Color primaryColor = Color(0xFF1EC28B);
  static const Color primaryColorLighter = Color(0xFF3DF1B8);
  static const Color primaryColorDarker = Color(0xFF0B7B5B);
  static const Color greydark = Color(0xFF504F5E);
  static const Color fieldColor = Color(0xFFF3F2F2);
  static const Color alert = Color(0xffED6363);
  static const Color redColor = Color(0xffF30A0A);
  static const Color primaryColorBrighter = Color(0xFFD7F4E6);
  static const Color lightGrey = Color(0xffE8E5E5);
  static const Color yellowStar = Color(0xffFCAE03);
  static const Color borderColor = Color(0xFFCECECE);

  static TextStyle get primaryTextStyle => GoogleFonts.getFont(
    poppins,
    color: Colors.black,
  );

  static TextStyle get priceTextStyle => GoogleFonts.getFont(
    poppins,
    color: ExploriaTheme.primaryColor,
  );

  static TextStyle get alertTextStyle => GoogleFonts.getFont(
    poppins,
    color: ExploriaTheme.alert,
  );

  static TextStyle get title => GoogleFonts.getFont(
    poppins,
    color: ExploriaTheme.primaryColorDarker,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );

  static TextStyle get bodyText => GoogleFonts.getFont(
      poppins,
      color: ExploriaTheme.greydark,
      fontWeight: FontWeight.w400,
      fontSize: 14);

  static TextStyle get title1 => GoogleFonts.getFont(
    poppins,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle get smallTitle => GoogleFonts.getFont(
    poppins,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle get smallTitleRed => GoogleFonts.getFont(
    poppins,
    color: redColor,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle get subTitle => GoogleFonts.getFont(
    poppins,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle get subTitleButton => GoogleFonts.getFont(
    poppins,
    color: primaryColor,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static TextStyle get text1 => GoogleFonts.getFont(
      poppins,
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 14);

  static TextStyle get darktitle => GoogleFonts.getFont(
    poppins,
    color: ExploriaTheme.greydark,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
}

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;