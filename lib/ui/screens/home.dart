import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:simple_calculator/constants/themes.dart';
import 'package:simple_calculator/ui/designs/helper_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool darkMode =
      WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          titleSpacing: 0,
          leading: IconButton(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () {
              ZoomDrawer.of(context)!.toggle();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
          title: Text(
            AppLocalizations.of(context)!.title,
          ),
          actions: [
            ThemeSwitcher(
              clipper: const ThemeSwitcherCircleClipper(),
              builder: (context) {
                return IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: () {
                    ThemeSwitcher.of(context).changeTheme(
                      theme: ThemeModelInheritedNotifier.of(context)
                                  .theme
                                  .brightness ==
                              Brightness.light
                          ? darkTheme
                          : lightTheme,
                    );
                  },
                  icon: Icon(
                    ThemeModelInheritedNotifier.of(context).theme.brightness ==
                            Brightness.light
                        ? Icons.nightlight_outlined
                        : Icons.sunny,
                  ),
                );
              },
            ),
            addHorizontalSpace(20),
          ],
        ),
      ),
    );
  }
}
