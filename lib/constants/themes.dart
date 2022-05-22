import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_calculator/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  /* light theme settings */
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: ConstantColors.kLightTheme,
      statusBarColor: ConstantColors.kLightTheme,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
    titleTextStyle: TextStyle(
      color: ConstantColors.kLightText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    backgroundColor: ConstantColors.kLightTheme,
    iconTheme: IconThemeData(color: ConstantColors.kLightText),
    actionsIconTheme: IconThemeData(
      color: ConstantColors.kLightText,
    ),
  ),
  scaffoldBackgroundColor: ConstantColors.kLightTheme,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  /* dart theme settings */
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: ConstantColors.kDarkTheme,
      statusBarColor: ConstantColors.kDarkTheme,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: ConstantColors.kDarkText,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    backgroundColor: ConstantColors.kDarkTheme,
    iconTheme: IconThemeData(color: ConstantColors.kDarkText),
  ),
  scaffoldBackgroundColor: ConstantColors.kDarkTheme,
);
