import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:simple_calculator/constants/colors.dart';
import 'package:simple_calculator/constants/themes.dart';
import 'package:simple_calculator/ui/designs/helper_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                      theme: isDark(context) ? lightTheme : darkTheme,
                    );
                  },
                  icon: Icon(
                    isDark(context) ? Icons.sunny : Icons.nightlight_outlined,
                  ),
                );
              },
            ),
            addHorizontalSpace(20.w),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 8,
              child: Container(height: 350.h),
            ),
            Flexible(
              flex: 10,
              child: Container(
                height: 461.h,
                color: isDark(context)
                    ? ConstantColors.kLightText
                    : ConstantColors.kDarkText,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        items(
                          txt: 'assets/svg/square_root.svg',
                          txtClr: isDark(context)
                              ? ConstantColors.kDarkText
                              : ConstantColors.kLightText,
                          fn: () {},
                          isSvg: true,
                        ),
                        items(
                          txt: 'assets/svg/parentheses.svg',
                          txtClr: isDark(context)
                              ? ConstantColors.kDarkText
                              : ConstantColors.kLightText,
                          fn: () {},
                          isSvg: true,
                        ),
                        items(
                          txt: 'assets/svg/percent.svg',
                          txtClr: isDark(context)
                              ? ConstantColors.kDarkText
                              : ConstantColors.kLightText,
                          fn: () {},
                          isSvg: true,
                        ),
                        items(
                          txt: 'assets/svg/divide.svg',
                          txtClr: isDark(context)
                              ? ConstantColors.kDarkText
                              : ConstantColors.kLightText,
                          fn: () {},
                          isSvg: true,
                        ),
                      ],
                    ),
                    itemsRow(
                      [
                        AppLocalizations.of(context)!.seven,
                        AppLocalizations.of(context)!.eight,
                        AppLocalizations.of(context)!.nine,
                        'assets/svg/multiply.svg',
                      ],
                      [() {}, () {}, () {}, () {}],
                    ),
                    itemsRow(
                      [
                        AppLocalizations.of(context)!.four,
                        AppLocalizations.of(context)!.five,
                        AppLocalizations.of(context)!.six,
                        'assets/svg/minus.svg',
                      ],
                      [() {}, () {}, () {}, () {}],
                    ),
                    itemsRow(
                      [
                        AppLocalizations.of(context)!.one,
                        AppLocalizations.of(context)!.two,
                        AppLocalizations.of(context)!.three,
                        'assets/svg/plus.svg',
                      ],
                      [() {}, () {}, () {}, () {}],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        items(
                          txt: 'assets/svg/plus_less.svg',
                          txtClr: isDark(context)
                              ? ConstantColors.kDarkText
                              : ConstantColors.kLightText,
                          fn: () {},
                          isSvg: true,
                        ),
                        items(
                          txt: AppLocalizations.of(context)!.zero,
                          txtClr: isDark(context)
                              ? ConstantColors.kDarkText
                              : ConstantColors.kLightText,
                          fn: () {},
                          isSvg: false,
                        ),
                        items(
                          txt: '.',
                          txtClr: isDark(context)
                              ? ConstantColors.kDarkText
                              : ConstantColors.kLightText,
                          fn: () {},
                          isSvg: false,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            color: isDark(context)
                                ? ConstantColors.kDarkMenu
                                : ConstantColors.kLightMenu,
                            height: 90.h,
                            width: 102.w,
                            child: Center(
                              child: SvgPicture.asset(
                                'assets/svg/equal.svg',
                                color: isDark(context)
                                    ? ConstantColors.kDarkText
                                    : ConstantColors.kLightText,
                                height: 18.h,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemsRow(List<String> itemsTxt, List<VoidCallback> itemsFn) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        items(
          txt: itemsTxt[0],
          txtClr: isDark(context)
              ? ConstantColors.kDarkText
              : ConstantColors.kLightText,
          fn: itemsFn[0],
          isSvg: false,
        ),
        items(
          txt: itemsTxt[1],
          txtClr: isDark(context)
              ? ConstantColors.kDarkText
              : ConstantColors.kLightText,
          fn: itemsFn[1],
          isSvg: false,
        ),
        items(
          txt: itemsTxt[2],
          txtClr: isDark(context)
              ? ConstantColors.kDarkText
              : ConstantColors.kLightText,
          fn: itemsFn[2],
          isSvg: false,
        ),
        items(
          txt: itemsTxt[3],
          txtClr: isDark(context)
              ? ConstantColors.kDarkText
              : ConstantColors.kLightText,
          fn: itemsFn[3],
          isSvg: true,
        ),
      ],
    );
  }

  Widget items(
      {required String txt,
      required Color txtClr,
      required VoidCallback fn,
      required bool isSvg,
      required}) {
    return isSvg
        ? InkWell(
            onTap: fn,
            child: SizedBox(
              height: 90.h,
              width: 102.w,
              child: Center(
                child: SvgPicture.asset(
                  txt,
                  color: txtClr,
                  height: 18.h,
                ),
              ),
            ),
          )
        : TextButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(Size(102.w, 90.h)),
            ),
            onPressed: fn,
            child: Text(
              txt,
              style: TextStyle(
                fontSize: 22.sp,
                color: txtClr,
              ),
            ),
          );
  }

  bool isDark(BuildContext context) {
    return ThemeModelInheritedNotifier.of(context).theme.brightness ==
        Brightness.dark;
  }
}
