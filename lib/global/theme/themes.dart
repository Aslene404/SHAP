import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const appFont = "Biotif";
// new colors
const goldColor = Color(0xFFDAA520);
const blueDark = Color.fromARGB(55, 165, 216, 24);

const darkTextColor = Color(0xFF666666);

const lightWidgetBackground = Color(0xFFD2D3DB);

//input text colors
const darkFocusedBorderColor = Color(0xFFF2F2F2);
const darkUnFocusedBorderColor = Color(0xFF454545);
const lightUnFocusedBorderColor = Color(0xFF454545);
const lightFocusedBorderColor = Color(0xFFF2F2F2);

//LIGHT MODE COLORS
const lightTextColor = Color(0xFF666666);
const lightPrimaryColor = Color(0xFF287EF5);
const lightAccentColor = Color(0xFFF93D38);
const successColor = Color(0xFF1FB40B);
const warningColor = Color(0xFFFA9438);
const yellowLight = Color(0xFFF5EDCF);
const greyLight = Color(0xFF9394A5);
const greyDark = Color(0xFFD9D9D9);
const blueLight = Color(0xFF1F7AF9);
const meduimGrey = Color(0xFF484B6A);
const blueSofort = Color.fromARGB(255, 3, 12, 63);

// color sh
const black = Color(0xFF292929);
const red = Color(0xFFCC0000);
const blue = Color(0xFF4368C7);
const blueSchwingum = Color(0xFF4AC0CC);
const grey = Color(0xFFA9A9A9);
const green = Color(0xFF6DD400);
const greyz = Color(0xFFEFEFEF);
const purple = Color(0xFF7E47FC);
const pink = Color(0xFFF8287B);
const blueGrey = Color(0xFF9BA7CF);
const amber = Colors.amber;
const orange = Color(0xFFF99F38);
const brown = Color(0xFF997950);

///THESE TOW COLORS ARE FOR THE BACKGROUND GEY_LIGHT FOR LIGHT_THEME AND BLACK FOR DARCK TEME
const lightModeBackgroundColor = Color(0xFFE4E5F1);
final ThemeData lightTheme = ThemeData(
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
  iconTheme: const IconThemeData(color: darkTextColor),
  scaffoldBackgroundColor: Colors.white,
  cardColor: lightWidgetBackground,
  colorScheme: const ColorScheme.light(),
  brightness: Brightness.light,
  backgroundColor: Colors.white70,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black87,
  ),
  radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith(
          (states) => darkUnFocusedBorderColor)),
  buttonTheme: const ButtonThemeData(
    buttonColor: lightPrimaryColor,
    textTheme: ButtonTextTheme.primary,
  ),
  cardTheme: CardTheme(
    color: lightModeBackgroundColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
  primaryColor: lightPrimaryColor,
  errorColor: lightAccentColor,
  snackBarTheme: const SnackBarThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2))),
    backgroundColor: successColor,
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    scaffoldBackgroundColor: Colors.white,
  ),
  textSelectionTheme: const TextSelectionThemeData(
    selectionColor: lightPrimaryColor,
    cursorColor: lightPrimaryColor,
    selectionHandleColor: lightPrimaryColor,
  ),
  highlightColor: meduimGrey,
  dialogTheme: const DialogTheme(
    backgroundColor: lightTextColor,
    elevation: 50,
  ),
  dialogBackgroundColor: lightTextColor,
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(color: meduimGrey),
    labelStyle: TextStyle(color: Colors.white),
    fillColor: Colors.white,
    filled: true,
    iconColor: black,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      borderSide: BorderSide(
        color: greyDark,
        width: 3.0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: greyDark,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      borderSide: BorderSide(color: lightAccentColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      borderSide: BorderSide(color: meduimGrey),
    ),
  ),
  focusColor: lightAccentColor,
  hintColor: lightAccentColor,
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontSize: 20.0,
      color: lightTextColor,
      fontFamily: appFont,
      fontWeight: FontWeight.w800,
    ),
    headline2: TextStyle(
        fontFamily: appFont,
        color: Colors.black87,
        fontSize: 18.0,
        fontWeight: FontWeight.w700),
    headline3: TextStyle(
      fontSize: 16.0,
      color: meduimGrey,
      fontFamily: appFont,
      fontWeight: FontWeight.w600,
    ),
    headline4: TextStyle(
        fontSize: 15.0,
        color: meduimGrey,
        fontFamily: appFont,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal),
    headline5: TextStyle(
      fontSize: 14.0,
      color: meduimGrey,
      fontFamily: appFont,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontSize: 12.0,
      color: lightTextColor,
      fontFamily: appFont,
      fontWeight: FontWeight.w200,
    ),
    subtitle1: TextStyle(
        fontSize: 12.0,
        color: lightTextColor,
        fontFamily: appFont,
        fontWeight: FontWeight.w200),
    subtitle2: TextStyle(
        fontSize: 10.0,
        color: lightTextColor,
        fontFamily: appFont,
        fontWeight: FontWeight.w100),
    bodyText1: TextStyle(
        fontSize: 13.0,
        color: lightTextColor,
        fontFamily: appFont,
        fontWeight: FontWeight.w300),
    bodyText2: TextStyle(
      fontSize: 11.0,
      color: lightTextColor,
      fontFamily: appFont,
      fontWeight: FontWeight.w300,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: lightPrimaryColor,
      textStyle: const TextStyle(
          fontFamily: appFont,
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w800),
      onPrimary: Colors.white,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  ),
  dividerTheme: const DividerThemeData(
    space: 10,
    thickness: 1,
    color: meduimGrey,
    indent: 10,
    endIndent: 10,
  ),
  dividerColor: Colors.white,
);
