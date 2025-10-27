import 'package:flutter/material.dart';

final lightMode = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    onBackground: Colors.black,
    primary: Colors.blue,
  ),
);

final darkMode = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    onBackground: Colors.white,
    primary: Colors.blue,
  ),
);
