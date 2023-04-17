
import 'package:bppshop_agent/provider/agent_dashboard_provider.dart';
import 'package:bppshop_agent/provider/agent_profile_provider.dart';
import 'package:bppshop_agent/provider/auth_provider.dart';
import 'package:bppshop_agent/provider/bottom_navigation_bar_provider.dart';
import 'package:bppshop_agent/provider/district_provider.dart';
import 'package:bppshop_agent/utill/app_color_resources.dart';
import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:bppshop_agent/view/screens/agent_update_profile.dart';
import 'package:bppshop_agent/view/screens/auth/login_page.dart';
import 'package:bppshop_agent/view/screens/auth/signup_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/add_customer_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/agent_profile_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/home_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/order_history_page.dart';
import 'package:bppshop_agent/view/screens/commission_history_page.dart';
import 'package:bppshop_agent/view/screens/customer_list_page.dart';
import 'package:bppshop_agent/view/screens/customer_page.dart';
import 'package:bppshop_agent/view/screens/customer_profile_page.dart';
import 'package:bppshop_agent/view/screens/dashboard_page.dart';
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:bppshop_agent/view/screens/landing_page.dart';
import 'package:bppshop_agent/view/screens/my_commission.dart';
import 'package:bppshop_agent/view/screens/pending_commission_page.dart';
import 'package:bppshop_agent/view/screens/update_customer_page.dart';
import 'package:bppshop_agent/view/screens/wallet_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'di_container.dart' as di;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (context)=> di.sl<AgentProfileProvider>()),
        ChangeNotifierProvider(create: (context)=> AgentDashboardProvider()),
        ChangeNotifierProvider(create: (context)=> DistrictProvider()),
        ChangeNotifierProvider(create: (context)=> di.sl<AuthProvider>()),
      ],
      child: MyApp()),
  );

  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Color(0xff2D9FB8)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
   //  ..customAnimation = CustomAnimation();
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColorResources.primaryMaterial,
    ));

    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppConstants.APP_NAME,
            builder: EasyLoading.init(),
            theme: ThemeData(
              primarySwatch: AppColorResources.primaryMaterial,
            ),
            initialRoute: SigninPage.routeName,
            routes: {
              SignUpPage.routeName : (context) => SignUpPage(),
              SigninPage.routeName : (context) => SigninPage(),
              AddCustomerPage.routeName : (context) => AddCustomerPage(),
              AgentProfilePage.routeName : (context) => AgentProfilePage(),
              HomePage.routeName:(context)=>HomePage(),
              OrderHistoryPage.routeName:(context)=>OrderHistoryPage(),
              AgentUpdateProfile.routeName:(context)=>AgentUpdateProfile(),
              CommissionHistoryPage.routeName:(context)=>CommissionHistoryPage(),
              CustomerListPage.routeName:(context)=>CustomerListPage(),
              CustomerPage.routeName:(context)=>CustomerPage(),
              CustomerProfilePage.routeName:(context)=>CustomerProfilePage(),
              DashboardPage.routeName:(context)=>DashboardPage(),
              MyCommissionPage.routeName:(context)=>MyCommissionPage(),
              PendingCommissionPage.routeName:(context)=>PendingCommissionPage(),
              UpdateCustomerPage.routeName:(context)=>UpdateCustomerPage(),
              WalletPage.routeName:(context)=>WalletPage(),
              MyDrawerPage.routeName:(context)=>MyDrawerPage(),
              LandingPage.routeName:(context)=>LandingPage()
            },
          );
        });
  }
}
