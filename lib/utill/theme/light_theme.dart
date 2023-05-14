import 'package:flutter/material.dart';

import '../app_color_resources.dart';

ThemeData lightTheme = ThemeData(
  //primaryColor: Color(0xffE37D4E),
  primaryColor: AppColorResources.borderColor,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xffEEEEEE),
  shadowColor: AppColorResources.shadowColor,
  dialogBackgroundColor: AppColorResources.primaryWhite,
  buttonTheme: ButtonThemeData(buttonColor: AppColorResources.primaryDeepBlue),
  drawerTheme: DrawerThemeData(backgroundColor: AppColorResources.primaryWhite),
  cardColor: AppColorResources.primaryWhite,
  highlightColor: AppColorResources.homeItemColor,
  secondaryHeaderColor: AppColorResources.homeItemColor,


  canvasColor: null,
  disabledColor: null,
  applyElevationOverlayColor: null,
  dividerColor: null,
  focusColor: null,
  hoverColor: null,
  indicatorColor: null,
  colorSchemeSeed: null,
  primaryColorDark: null,
  primaryColorLight: null,

  splashColor: null,
  //textSelectionColor: null,
  //textSelectionHandleColor: null,
  unselectedWidgetColor: null,
  hintColor: Color(0xFF9E9E9E),
  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
