
import 'package:bppshop_agent/localization/app_localization.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/add_customer_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/agent_profile_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/home_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/order_history_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utill/app_color_resources.dart';
import '../utill/app_style.dart';
import '../view/screens/landing_page.dart';
import '../view/widgets/navigation_service_without_context.dart';

class BottomNavigationBarProvider with ChangeNotifier{
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void updateSelectedIndex(){
    _selectedIndex=0;
    notifyListeners();
  }

  Widget bottomNavigationBar(BuildContext context,bool isLanding) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColorResources.navBarBgColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedLabelStyle: myStyleMontserrat(11.sp, AppColorResources.bottomLabelColor, FontWeight.w500),
      selectedLabelStyle: myStyleMontserrat(11.sp, AppColorResources.bottomLabelColor, FontWeight.w500),
      selectedItemColor: AppColorResources.primaryOrange,
      unselectedItemColor: AppColorResources.bottomLabelColor,
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          //backgroundColor: navBarBgColor,
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.home.toString(),
        ),
        BottomNavigationBarItem(
          //backgroundColor: navBarBgColor,
          icon: Icon(Icons.access_time_filled_outlined),
          label: AppLocalizations.of(context)!.order_history.toString(),
        ),
        BottomNavigationBarItem(
          //backgroundColor: navBarBgColor,
          icon: Icon(Icons.person),
          label: AppLocalizations.of(context)!.profile.toString(),
        ),BottomNavigationBarItem(
          //backgroundColor: navBarBgColor,
          icon: Icon(Icons.person_add_alt_1),
          label: AppLocalizations.of(context)!.add_customer.toString(),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap:(index){
        onItemTapped(index,context,isLanding);
      },
    );
  }

   onItemTapped(int index,BuildContext context,bool isLanding) {
    _selectedIndex = index;
    if(!isLanding){
      Navigator.pushNamedAndRemoveUntil(context, LandingPage.routeName, (route) => false);
    }
    notifyListeners();
  }

  Widget? getWidget(int index,BuildContext context) {
    if (index == 0 ) {
      return HomePage();
    }
    if (index == 1 ) {
      return OrderHistoryPage();
    }
    if (index == 2) {
      return AgentProfilePage();
    }
    if (index == 3) {
      return  AddCustomerPage() ;
    }
    notifyListeners();
  }

}