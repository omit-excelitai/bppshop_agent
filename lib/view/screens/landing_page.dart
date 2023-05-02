
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../provider/bottom_navigation_bar_provider.dart';
import '../widgets/no_internet_connection_widget.dart';

class LandingPage extends StatelessWidget {
  static const String routeName = '/landing_page';
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Consumer<BottomNavigationBarProvider>(
      builder: (context,bottomNavigationBarProvider,child){
        return Scaffold(
           body : bottomNavigationBarProvider.getWidget(bottomNavigationBarProvider.selectedIndex,context),
           bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context,true),
        );
      },
    );
  }
}
