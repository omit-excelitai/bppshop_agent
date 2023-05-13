
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

  saveToken(token)async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var token = sharedPreferences.getString("token");
    return token;
  }
  
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Drawer(
        width: 233.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              //height: 72.h,
              color: AppColorResources.drawerHeaderColor,
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed(HomePage.routeName);
                },
                child: Row(
                  children: [
                    Image.asset("images/logo1.png",height: 48.h,width: 48.h,),
                    SizedBox(width: 17.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("BPPSHOP", style: myStyleMontserrat(16.sp, AppColorResources.secondaryWhite, FontWeight.w500),),
                        Text("Agent Panel", style: myStyleMontserrat(16.sp, AppColorResources.secondaryWhite, FontWeight.w500),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              //padding: EdgeInsets.fromLTRB(15.w, 18.h, 17.w, 12.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          count = 1;
                        });
                        Navigator.of(context).pushNamed(DashboardPage.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 18.w, top: 18.h),
                        child: Row(
                          children: [
                            Image.asset("images/dash.png",height: 18.h,width: 18.w, color: count == 1?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                            SizedBox(width: 12.w,),
                            Text("Dashboard", style: myStyleMontserrat(16.sp, count == 1?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: ExpansionTile(
                        iconColor: AppColorResources.primaryOrange,
                        title: Row(
                          children: [
                            Image.asset("images/people.png", height: 15.h,width: 20.w),
                            SizedBox(width: 12.w,),
                            Text("Customer", style: myStyleMontserrat(16.sp, AppColorResources.drawerItemColor, FontWeight.w500),),
                          ],
                        ),
                        // leading: Image.asset("images/people.png", height: 15.h,width: 20.w),
                        // title: Text("Customer", style: myStyleMontserrat(16.sp, drawerItemColor, FontWeight.w500),),
                        children: [
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                count = 2;
                              });
                              Navigator.of(context).pushNamed(CustomerListPage.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 40.w),
                              child: Row(
                                children: [
                                  Image.asset("images/peoplelist.png", height: 13.5.h,width: 18.w, color: count == 2?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                                  SizedBox(width: 12.w,),
                                  Text("Customer List", style: myStyleMontserrat(14.sp, count == 2?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 22.h,),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                count = 3;
                              });
                              Navigator.of(context).pushNamed(AddCustomerPage.routeName);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 40.w, bottom: 10.h),
                              child: Row(
                                children: [
                                  Image.asset("images/personfilladd.png", height: 18.h,width: 18.w, color: count == 3?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                                  SizedBox(width: 12.w,),
                                  Text("Add Customer", style: myStyleMontserrat(14.sp, count == 3?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          count = 4;
                        });
                        Navigator.of(context).pushNamed(OrderHistoryPage.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w, top: 18.h),
                        child: Row(
                          children: [
                            Image.asset("images/clockhistory.png",height: 20.h,width: 20.w,color: count == 4?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                            SizedBox(width: 12.w,),
                            Text("Order History", style: myStyleMontserrat(16.sp, count == 4?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 18.h,),
                    ExpansionTile(
                      iconColor: AppColorResources.primaryOrange,
                      title: Row(
                        children: [
                          Image.asset("images/cash.png",height: 14.h,width: 20.w,),
                          SizedBox(width: 12.h,),
                          Text("My Commission", style: myStyleMontserrat(16.sp, AppColorResources.drawerItemColor, FontWeight.w500),),
                        ],
                      ),
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              count = 5;
                            });
                            Navigator.of(context).pushNamed(PendingCommissionPage.routeName);
                          },
                          child: Container(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Row(
                              children: [
                                Image.asset("images/hourglass.png", height: 15.75.h,width: 13.5.w,color: count == 5?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                                SizedBox(width: 12.w,),
                                Text("Pending Commission", style: myStyleMontserrat(14.sp, count == 5?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              count = 6;
                            });
                            Navigator.of(context).pushNamed(CommissionHistoryPage.routeName);
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 22.h, bottom: 10.h),
                            padding: EdgeInsets.only(left: 40.w),
                            child: Row(
                              children: [
                                Image.asset("images/clockhistory.png",height: 15.h,width: 15.w,color: count == 6?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                                SizedBox(width: 12.w,),
                                Text("Commission History", style: myStyleMontserrat(14.sp, count == 6?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          count = 7;
                        });
                        Navigator.of(context).pushNamed(WalletPage.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 15.w, top: 18.h),
                        child: Row(
                          children: [
                            Image.asset("images/walletfill.png",height: 24.h,width: 24.w, color: count == 7?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                            SizedBox(width: 12.w,),
                            Text("Wallet", style: myStyleMontserrat(16.sp, count == 7?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
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
                            Image.asset("images/logout.png",height: 20.h,width: 20.w, color: count == 8?AppColorResources.primaryOrange:AppColorResources.drawerItemColor,),
                            SizedBox(width: 12.w,),
                            Text("Logout", style: myStyleMontserrat(16.sp, count == 8?AppColorResources.primaryOrange:AppColorResources.drawerItemColor, FontWeight.w500),),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Change Theme", style: TextStyle(fontSize: 22.sp, color: AppColorResources.primaryGreen, fontWeight: FontWeight.w500),),
                        FlutterSwitch(
                          activeText: "Light",
                          inactiveText: "Dark",
                          activeTextColor: AppColorResources.primaryWhite,
                          inactiveTextColor: AppColorResources.primaryWhite,
                          activeColor: AppColorResources.primaryOrange,
                          inactiveColor: AppColorResources.primaryOrange,
                          valueFontSize: 14.0.sp,
                          toggleSize: 25.0.sp,
                          value: themeProvider.themeData?.brightness == Brightness.dark,
                          borderRadius: 40.0.r,
                          padding: 5,
                          showOnOff: true,
                          inactiveIcon: Icon(Icons.light_mode, color: AppColorResources.primaryBlack,),
                          activeIcon: Icon(Icons.dark_mode, color: AppColorResources.primaryBlack,),
                          onToggle: (_) {
                            themeProvider.toggleTheme();
                          },
                        ),
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
}
