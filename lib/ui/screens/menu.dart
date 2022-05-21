import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/constants/colors.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          ThemeModelInheritedNotifier.of(context).theme.brightness ==
                  Brightness.light
              ? ConstantColors.kLightMenu
              : ConstantColors.kDarkMenu,
    );
  }
}
