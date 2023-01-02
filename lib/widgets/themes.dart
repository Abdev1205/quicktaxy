import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.amber,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(color: Colors.amber),
        iconTheme: const IconThemeData(color: Colors.black),
        
  );
  // static ThemeData DarkTheme(BuildContext context) => ThemeData(
  //   primarySwatch: Colors.amber,
  //       brightness: Brightness.dark,
  //       appBarTheme: AppBarTheme(color: Colors.black),
  //       iconTheme: IconThemeData(color: Colors.black),
  // );
}
