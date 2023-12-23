import 'package:flutter/material.dart';


class AppTheme {

  AppTheme();
  ThemeData getTheme()=> ThemeData(
    useMaterial3: true,
    colorSchemeSeed: Colors.amber,
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );
}