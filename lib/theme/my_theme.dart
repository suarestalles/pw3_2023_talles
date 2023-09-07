import 'package:aprendendo_flutter/theme/my_colors.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static final lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: MyColors.primaryColor,
      foregroundColor: MyColors.secondaryColor,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: MyColors.primaryColor,
      foregroundColor: MyColors.secondaryColor
    ),
    cardTheme: const CardTheme(
      color: MyColors.terciaryColor,
    )
  );
  static final darkTheme = ThemeData.dark(
    useMaterial3: true,
  );
}