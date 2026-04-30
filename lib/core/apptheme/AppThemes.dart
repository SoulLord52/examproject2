import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarThemeData(backgroundColor: Colors.white,),
    colorScheme: ColorScheme.light(primary: Color(0XFFFF5A60)),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarThemeData(backgroundColor: Colors.black,),
    colorScheme: ColorScheme.dark(primary: Color(0XFFFF5A60)),
  );
  static final ThemeData blue = ThemeData(
    scaffoldBackgroundColor: Color(0XFFE8EEFF),
    appBarTheme: AppBarThemeData(backgroundColor: Color(0XFFE8EEFF),),
    colorScheme: ColorScheme.dark(primary: Color(0XFF5C9DFE)),
  );
  static final ThemeData green = ThemeData(
    scaffoldBackgroundColor: Color(0XFFDBDDD7),
    appBarTheme: AppBarThemeData(backgroundColor: Color(0XFFDBDDD7),),
    colorScheme: ColorScheme.dark(primary: Color(0XFF4E5851)),
  );
  static final ThemeData gold = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarThemeData(backgroundColor: Colors.black,),
    colorScheme: ColorScheme.dark(primary: Color(0XFFFAD7BD)),
  );
}
