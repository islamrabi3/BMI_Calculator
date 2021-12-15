import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final lightthemeData = ThemeData(
  primarySwatch: Colors.amber,
  appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.orangeAccent,
  )),
);

final darkThemeData = ThemeData(
  primaryColorDark: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 10.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.deepOrangeAccent,
    ),
    toolbarHeight: 100.0,
  ),
  androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
  canvasColor: Colors.white,
  sliderTheme: SliderThemeData(
      activeTrackColor: Colors.orangeAccent,
      inactiveTrackColor: Colors.black26,
      thumbColor: Colors.orangeAccent),
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.orangeAccent),
);
