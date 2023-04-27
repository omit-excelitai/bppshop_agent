import 'package:bppshop_agent/view/screens/customer_profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Navigation Service Without Context

/// For NavigationService
class NavigationService {

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  dynamic routeTo(dynamic route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  dynamic goBack() {
    return navigatorKey.currentState?.pop();
  }
}

/// For RouteGenerator
class RouteGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch(settings.name) {
      case '/customer_profile_page':
        return MaterialPageRoute(builder: (context) => CustomerProfilePage());
      // case '/screen2':
      //   return MaterialPageRoute(builder: (context) => ScreenTwo());

      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text("Not found ${settings.name}"),
          ),
        ));
    }
  }
}