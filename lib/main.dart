import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:simple_calculator/constants/themes.dart';
import 'package:simple_calculator/l10n/l10n.dart';
import 'package:simple_calculator/state_management/bindings/initial.dart';
import 'package:simple_calculator/ui/drawer.dart';
import 'package:simple_calculator/ui/screens/home.dart';
import 'package:simple_calculator/ui/screens/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool darkMode =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    return ThemeProvider(
      initTheme: darkMode ? darkTheme : lightTheme,
      builder: (_, myTheme) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          supportedLocales: L10n.all,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          getPages: [
            GetPage(
              name: SplashScreen.routeName,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: DrawerSetup.routeName,
              page: () => const DrawerSetup(),
              binding: InitialBinding(),
            ),
          ],
          initialRoute: SplashScreen.routeName,
        );
      },
    );
  }
}
