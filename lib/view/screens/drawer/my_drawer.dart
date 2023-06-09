import 'package:bppshop_agent/provider/locale_provider.dart';
import 'package:bppshop_agent/utill/app_color_resources.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/add_customer_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/home_page.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/order_history_page.dart';
import 'package:bppshop_agent/view/screens/commission_history_page.dart';
import 'package:bppshop_agent/view/screens/customer_list_page.dart';
import 'package:bppshop_agent/view/screens/dashboard_page.dart';
import 'package:bppshop_agent/view/screens/pending_commission_page.dart';
import 'package:bppshop_agent/view/screens/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../localization/app_localization.dart';
import '../../../provider/theme_provider.dart';
import '../../../utill/app_style.dart';
import '../../widgets/show_logout_alert.dart';

class MyDrawerPage extends StatefulWidget {
  static const String routeName = '/my_drawer';
  const MyDrawerPage({Key? key}) : super(key: key);

  @override
  State<MyDrawerPage> createState() => _MyDrawerPageState();
}

class _MyDrawerPageState extends State<MyDrawerPage> {
  int count = 1;

  saveToken(token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    return token;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider = Provider.of<LocaleProvider>(context);
    return SafeArea(
      child: Drawer(
        width: 233.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                //height: 72.h,
                color: AppColorResources.drawerHeaderColor,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        "images/logo1.png",
                        height: 48.h,
                        width: 48.h,
                      ),
                      SizedBox(
                        width: 17.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.bpp_shop.toString(),
                            style: myStyleMontserrat(
                                16.sp,
                                AppColorResources.secondaryWhite,
                                FontWeight.w500),
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .agent_panel
                                .toString(),
                            style: myStyleMontserrat(
                                16.sp,
                                AppColorResources.secondaryWhite,
                                FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //padding: EdgeInsets.fromLTRB(15.w, 18.h, 17.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          count = 1;
                        });
                        Navigator.of(context)
                            .pushNamed(DashboardPage.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 18.w, top: 18.h),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/dash.png",
                              height: 18.h,
                              width: 18.w,
                              color: count == 1
                                  ? AppColorResources.primaryOrange
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .dashboard
                                  .toString(),
                              style: myStyleMontserrat(
                                  16.sp,
                                  count == 1
                                      ? AppColorResources.primaryOrange
                                      : Theme.of(context).unselectedWidgetColor,
                                  FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ExpansionTile(
                        iconColor: AppColorResources.primaryOrange,
                        title: Row(
                          children: [
                            Image.asset(
                              "images/people.png",
                              height: 15.h,
                              width: 20.w,
                              color: Theme.of(context).unselectedWidgetColor,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!.customer.toString(),
                              style: myStyleMontserrat(
                                  16.sp,
                                  Theme.of(context).unselectedWidgetColor,
                                  FontWeight.w500),
                            ),
                          ],
                        ),
                        // leading: Image.asset("images/people.png", height: 15.h,width: 20.w),
                        // title: Text("Customer", style: myStyleMontserrat(16.sp, drawerItemColor, FontWeight.w500),),
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count = 2;
                              });
                              Navigator.of(context)
                                  .pushNamed(CustomerListPage.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 40.w),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "images/peoplelist.png",
                                    height: 13.5.h,
                                    width: 18.w,
                                    color: count == 2
                                        ? AppColorResources.primaryOrange
                                        : Theme.of(context)
                                            .unselectedWidgetColor,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .customer_list
                                        .toString(),
                                    style: myStyleMontserrat(
                                        14.sp,
                                        count == 2
                                            ? AppColorResources.primaryOrange
                                            : Theme.of(context)
                                                .unselectedWidgetColor,
                                        FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                count = 3;
                              });
                              Navigator.of(context)
                                  .pushNamed(AddCustomerPage.routeName);
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.only(left: 40.w, bottom: 10.h),
                              child: Row(
                                children: [
                                  Image.asset(
                                    "images/personfilladd.png",
                                    height: 18.h,
                                    width: 18.w,
                                    color: count == 3
                                        ? AppColorResources.primaryOrange
                                        : Theme.of(context)
                                            .unselectedWidgetColor,
                                  ),
                                  SizedBox(
                                    width: 12.w,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .add_customer
                                        .toString(),
                                    style: myStyleMontserrat(
                                        14.sp,
                                        count == 3
                                            ? AppColorResources.primaryOrange
                                            : Theme.of(context)
                                                .unselectedWidgetColor,
                                        FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          count = 4;
                        });
                        Navigator.of(context)
                            .pushNamed(OrderHistoryPage.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w, top: 18.h),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/clockhistory.png",
                              height: 20.h,
                              width: 20.w,
                              color: count == 4
                                  ? AppColorResources.primaryOrange
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .order_history
                                  .toString(),
                              style: myStyleMontserrat(
                                  16.sp,
                                  count == 4
                                      ? AppColorResources.primaryOrange
                                      : Theme.of(context).unselectedWidgetColor,
                                  FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    ExpansionTile(
                      iconColor: AppColorResources.primaryOrange,
                      title: Row(
                        children: [
                          Image.asset(
                            "images/cash.png",
                            height: 14.h,
                            width: 20.w,
                            color: Theme.of(context).unselectedWidgetColor,
                          ),
                          SizedBox(
                            width: 12.h,
                          ),
                          Text(
                            AppLocalizations.of(context)!
                                .my_commission
                                .toString(),
                            style: myStyleMontserrat(
                                16.sp,
                                Theme.of(context).unselectedWidgetColor,
                                FontWeight.w500),
                          ),
                        ],
                      ),
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count = 5;
                            });
                            Navigator.of(context)
                                .pushNamed(PendingCommissionPage.routeName);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  "images/hourglass.png",
                                  height: 15.75.h,
                                  width: 13.5.w,
                                  color: count == 5
                                      ? AppColorResources.primaryOrange
                                      : Theme.of(context).unselectedWidgetColor,
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .pending_commission
                                      .toString(),
                                  style: myStyleMontserrat(
                                      14.sp,
                                      count == 5
                                          ? AppColorResources.primaryOrange
                                          : Theme.of(context)
                                              .unselectedWidgetColor,
                                      FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              count = 6;
                            });
                            Navigator.of(context)
                                .pushNamed(CommissionHistoryPage.routeName);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 22.h, bottom: 10.h),
                            padding: EdgeInsets.only(left: 40.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  "images/clockhistory.png",
                                  height: 15.h,
                                  width: 15.w,
                                  color: count == 6
                                      ? AppColorResources.primaryOrange
                                      : Theme.of(context).unselectedWidgetColor,
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .commission_history
                                      .toString(),
                                  style: myStyleMontserrat(
                                      14.sp,
                                      count == 6
                                          ? AppColorResources.primaryOrange
                                          : Theme.of(context)
                                              .unselectedWidgetColor,
                                      FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          count = 7;
                        });
                        Navigator.of(context).pushNamed(WalletPage.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w, top: 18.h),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/walletfill.png",
                              height: 24.h,
                              width: 24.w,
                              color: count == 7
                                  ? AppColorResources.primaryOrange
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!.wallet.toString(),
                              style: myStyleMontserrat(
                                  16.sp,
                                  count == 7
                                      ? AppColorResources.primaryOrange
                                      : Theme.of(context).unselectedWidgetColor,
                                  FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        logoutAlert(context);
                        setState(() {
                          count = 8;
                          saveToken(null);
                        });
                        //Navigator.of(context).pushNamedAndRemoveUntil(SigninPage.routeName, (route) => false);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 16.w, top: 34.h),
                        child: Row(
                          children: [
                            Image.asset(
                              "images/logout.png",
                              height: 20.h,
                              width: 20.w,
                              color: count == 8
                                  ? AppColorResources.primaryOrange
                                  : Theme.of(context).unselectedWidgetColor,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Text(
                              AppLocalizations.of(context)!.logout.toString(),
                              style: myStyleMontserrat(
                                  16.sp,
                                  count == 8
                                      ? AppColorResources.primaryOrange
                                      : Theme.of(context).unselectedWidgetColor,
                                  FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.w, right: 16.w, top: 25.h, bottom: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "images/theme.png",
                                height: 22.h,
                                width: 22.w,
                                color: Theme.of(context).unselectedWidgetColor,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Text(
                                  AppLocalizations.of(context)!
                                      .theme
                                      .toString(),
                                  style: myStyleMontserrat(
                                      16.sp,
                                      Theme.of(context).unselectedWidgetColor,
                                      FontWeight.w500)),
                            ],
                          ),
                          FlutterSwitch(
                            width: 65.w,
                            activeText: "Light",
                            inactiveText: "Dark",
                            activeTextColor: AppColorResources.primaryWhite,
                            inactiveTextColor: AppColorResources.primaryWhite,
                            activeColor: AppColorResources.primaryOrange,
                            inactiveColor: AppColorResources.primaryOrange,
                            valueFontSize: 14.0.sp,
                            toggleSize: 25.0.sp,
                            value: themeProvider.themeData?.brightness ==
                                Brightness.dark,
                            borderRadius: 40.0.r,
                            padding: 5,
                            showOnOff: true,
                            inactiveIcon: Icon(
                              Icons.light_mode,
                              color: AppColorResources.primaryOrange,
                            ),
                            activeIcon: Icon(
                              Icons.dark_mode,
                              color: AppColorResources.primaryBlack,
                            ),
                            onToggle: (_) {
                              themeProvider.toggleTheme();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 16.w, right: 16.w, bottom: 20.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.language_outlined,
                                size: 23.sp,
                                color: Theme.of(context).unselectedWidgetColor,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .switchButton
                                    .toString(),
                                style: myStyleMontserrat(
                                    16.sp,
                                    Theme.of(context).unselectedWidgetColor,
                                    FontWeight.w500),
                              ),
                            ],
                          ),
                          FlutterSwitch(
                            width: 65.w,
                            activeText: "EN",
                            inactiveText: "BN",
                            activeTextColor: AppColorResources.primaryWhite,
                            inactiveTextColor: AppColorResources.primaryWhite,
                            activeColor: AppColorResources.primaryOrange,
                            inactiveColor: AppColorResources.primaryOrange,
                            inactiveIcon: Icon(
                              Icons.language_outlined,
                              color: AppColorResources.primaryBlack,
                            ),
                            activeIcon: Icon(
                              Icons.language_outlined,
                              color: AppColorResources.primaryBlack,
                            ),
                            valueFontSize: 14.0.sp,
                            toggleSize: 25.0.sp,
                            value: localeProvider.locale?.languageCode == 'bn',
                            borderRadius: 40.0.r,
                            padding: 5,
                            showOnOff: true,
                            onToggle: (value) {
                              final newLocale = value
                                  ? const Locale('bn')
                                  : const Locale('en');
                              localeProvider.setLanguage(newLocale.toString());
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
