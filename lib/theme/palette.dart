import 'package:flutter/material.dart';

class Palette {
  // Colors
  static const blackColor = Color.fromRGBO(0, 0, 0, 1.0); // primary color
  static const darkGreenColor =
      Color.fromRGBO(26, 38, 21,1); // secondary color
  static const greyGreenColor = Color.fromRGBO(
      112, 140, 132, 0.5254901960784314);
  static const whiteColor = Colors.white;
  static var orangeColor = const Color.fromRGBO(242, 124, 56, 1);
  static var blueColor = const Color.fromRGBO(220, 238, 242, 1);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyGreenColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: darkGreenColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: darkGreenColor,
    ),
    primaryColor: orangeColor,
    backgroundColor:
        darkGreenColor, // will be used as alternative background color
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyGreenColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: orangeColor,
    backgroundColor: whiteColor,
  );
}
