import 'package:flutter/material.dart';

import '../app_color_resources.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Color(0xFF0B4461),
  cardColor: null,
  drawerTheme: DrawerThemeData(backgroundColor: Color(0xFF0B4461)),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF0B4461),
  buttonTheme: ButtonThemeData(buttonColor: AppColorResources.primaryOrange),
  shadowColor: AppColorResources.appBarColor,
  dialogBackgroundColor: AppColorResources.appBarColor,

  disabledColor: null,
  applyElevationOverlayColor: null,
  dividerColor: null,
  focusColor: null,
  hoverColor: null,
  indicatorColor: null,
  colorScheme: null,
  colorSchemeSeed: null,
  primaryColorDark: null,
  primaryColorLight: null,
  secondaryHeaderColor: null,
  //splashColor: Color(0xffFFFFFF),
  unselectedWidgetColor: null,
  highlightColor: Color(0xff0F2333),
  //hintColor: Color(0xFFc7c7c7),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
