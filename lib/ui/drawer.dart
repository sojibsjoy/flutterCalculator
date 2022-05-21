import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:simple_calculator/constants/colors.dart';
import 'package:simple_calculator/ui/screens/home.dart';
import 'package:simple_calculator/ui/screens/menu.dart';

class DrawerSetup extends StatelessWidget {
  static String routeName = '/home';
  const DrawerSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      duration: const Duration(milliseconds: 400),
      angle: -10,
      borderRadius: 35.0,
      showShadow: true,
      menuScreenWidth: double.infinity,
      shadowLayer1Color:
          ThemeModelInheritedNotifier.of(context).theme.brightness ==
                  Brightness.light
              ? ConstantColors.kLightTheme3
              : ConstantColors.kDarkTheme3,
      shadowLayer2Color:
          ThemeModelInheritedNotifier.of(context).theme.brightness ==
                  Brightness.light
              ? ConstantColors.kLightTheme2
              : ConstantColors.kDarkTheme2,
      menuBackgroundColor:
          ThemeModelInheritedNotifier.of(context).theme.brightness ==
                  Brightness.light
              ? ConstantColors.kLightMenu
              : ConstantColors.kDarkMenu,
      mainScreenTapClose: true,
      style: DrawerStyle.defaultStyle,
      menuScreen: const MenuScreen(),
      mainScreen: const HomeScreen(),
    );
  }
}
