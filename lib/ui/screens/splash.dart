import 'dart:async';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/constants/colors.dart';
import 'package:simple_calculator/ui/drawer.dart';
import 'package:simple_calculator/ui/screens/home.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(milliseconds: 1300),
      () => Get.offNamed(DrawerSetup.routeName),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            ThemeModelInheritedNotifier.of(context).theme.brightness ==
                    Brightness.light
                ? ConstantColors.kLightTheme
                : ConstantColors.kDarkTheme,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor:
              ThemeModelInheritedNotifier.of(context).theme.brightness ==
                      Brightness.light
                  ? ConstantColors.kLightTheme
                  : ConstantColors.kDarkTheme,
          statusBarColor:
              ThemeModelInheritedNotifier.of(context).theme.brightness ==
                      Brightness.light
                  ? ConstantColors.kLightTheme
                  : ConstantColors.kDarkTheme,
          statusBarIconBrightness:
              ThemeModelInheritedNotifier.of(context).theme.brightness ==
                      Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
          statusBarBrightness:
              ThemeModelInheritedNotifier.of(context).theme.brightness ==
                      Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SpinKitRipple(
                color: ConstantColors.kAppColor,
                size: 50,
                duration: const Duration(milliseconds: 1500),
                borderWidth: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
