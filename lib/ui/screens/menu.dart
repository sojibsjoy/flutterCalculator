import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:simple_calculator/constants/colors.dart';
import 'package:simple_calculator/l10n/l10n.dart';
import 'package:simple_calculator/ui/designs/helper_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int? _selectedLan = 0;
  final _languageIndx = [
    0,
    1,
    2,
  ];
  final _languageList = [
    'en',
    'bn',
    'hi',
  ];
  final _flagList = [
    'assets/images/en.png',
    'assets/images/bn.png',
    'assets/images/hi.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark(context)
            ? ConstantColors.kDarkMenu
            : ConstantColors.kLightMenu,
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: isDark(context)
              ? ConstantColors.kDarkMenu
              : ConstantColors.kLightMenu,
          statusBarColor: isDark(context)
              ? ConstantColors.kDarkMenu
              : ConstantColors.kLightMenu,
          statusBarIconBrightness:
              isDark(context) ? Brightness.dark : Brightness.light,
          statusBarBrightness:
              isDark(context) ? Brightness.dark : Brightness.light,
        ),
        toolbarHeight: 0,
        elevation: 0,
      ),
      backgroundColor: isDark(context)
          ? ConstantColors.kDarkMenu
          : ConstantColors.kLightMenu,
      body: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpac(30.h),
            DropdownButton2<int>(
              dropdownDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              dropdownElevation: 0,
              itemPadding: EdgeInsets.zero,
              value: _selectedLan,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: isDark(context)
                    ? ConstantColors.kDarkText
                    : ConstantColors.kLightText,
              ),
              items: _languageIndx.map(buildDDMenuItem).toList(),
              onChanged: (value) => setState((() {
                _selectedLan = value;
                Get.updateLocale(L10n.all[_selectedLan!]);
              })),
            ),
            addVerticalSpac(350.h),
            menuItem(
              icon: Icons.date_range_outlined,
              title: 'Date Calculator',
              fn: () {},
            ),
            addVerticalSpac(20.h),
            menuItem(
              icon: Icons.date_range_outlined,
              title: 'Date Calculator',
              fn: () {},
            ),
            addVerticalSpac(20.h),
            menuItem(
              icon: Icons.date_range_outlined,
              title: 'Date Calculator',
              fn: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget menuItem({
    required IconData icon,
    required String title,
    required VoidCallback fn,
  }) {
    return InkWell(
      onTap: fn,
      child: Row(
        children: [
          Container(
            height: 70.h,
            width: 70.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.r),
              color: isDark(context)
                  ? ConstantColors.kDarkTheme3.withOpacity(0.8)
                  : ConstantColors.kLightTheme3.withOpacity(0.8),
            ),
            child: Icon(
              icon,
              size: 35.h,
              color: isDark(context)
                  ? ConstantColors.kLightTheme2
                  : ConstantColors.kDarkTheme2,
            ),
          ),
          addHorizontalSpace(10.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              color: isDark(context)
                  ? ConstantColors.kLightTheme2
                  : ConstantColors.kDarkTheme2,
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<int> buildDDMenuItem(int item) => DropdownMenuItem(
        value: item,
        child: Container(
          height: 45.h,
          width: 70.w,
          margin: EdgeInsets.only(left: 10.w),
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            color: isDark(context)
                ? ConstantColors.kDarkTheme3.withOpacity(0.8)
                : ConstantColors.kLightTheme3.withOpacity(0.8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Image.asset(
                  _flagList[item],
                ),
              ),
              Text(
                _languageList[item],
                style: TextStyle(
                  color: isDark(context)
                      ? ConstantColors.kDarkText
                      : ConstantColors.kLightText,
                ),
              ),
            ],
          ),
        ),
      );

  bool isDark(BuildContext context) {
    return ThemeModelInheritedNotifier.of(context).theme.brightness ==
        Brightness.dark;
  }
}
