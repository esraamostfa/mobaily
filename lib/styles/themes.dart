import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobaily/styles/colors.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: defaultColor,
    appBarTheme: const AppBarTheme(
        titleSpacing: 21,
        color: defaultColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 21.0,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: defaultColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      elevation: 21,
    ),
    scaffoldBackgroundColor: Colors.blueGrey[100],
    textTheme: const TextTheme(bodyText1: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ))
);

ThemeData darkTheme = ThemeData(
    primarySwatch: defaultColor,
    appBarTheme: const AppBarTheme(
        titleSpacing: 21,
        color: defaultColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 21.0,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.white),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light,
        )),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: defaultColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defaultColor,
      unselectedItemColor: Colors.grey,
      backgroundColor: defaultColor,
      elevation: 21,
    ),
    scaffoldBackgroundColor: defaultColor,
    textTheme: const TextTheme(bodyText1: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ))
);