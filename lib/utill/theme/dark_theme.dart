import 'package:flutter/material.dart';
import '../app_color_resources.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: AppColorResources.primaryOrange,
  cardColor: AppColorResources.appBarColor,
  drawerTheme: DrawerThemeData(backgroundColor: Color(0xFF0B4461)),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF0B4461),
  buttonTheme: ButtonThemeData(buttonColor: AppColorResources.primaryOrange),
  shadowColor: AppColorResources.appBarColor,
  dialogBackgroundColor: AppColorResources.appBarColor,
  highlightColor: AppColorResources.primaryWhite,
  secondaryHeaderColor: AppColorResources.primaryWhite,
  dividerColor: AppColorResources.primaryWhite,
  hintColor: AppColorResources.secondaryWhite,
  unselectedWidgetColor: AppColorResources.secondaryWhite,

  disabledColor: null,
  applyElevationOverlayColor: null,

  focusColor: null,
  hoverColor: null,
  indicatorColor: null,
  colorScheme: null,
  colorSchemeSeed: null,
  primaryColorDark: null,
  primaryColorLight: null,

  //splashColor: Color(0xffFFFFFF),

  pageTransitionsTheme: PageTransitionsTheme(builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
    TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
  }),
);
