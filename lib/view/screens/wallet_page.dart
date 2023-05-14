
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../provider/agent_dashboard_provider.dart';
import '../../provider/agent_profile_provider.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/no_internet_connection_widget.dart';
import '../widgets/transaction_table.dart';

class WalletPage extends StatefulWidget {
  static const String routeName = '/wallet_page';
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AgentProfileProvider>(context, listen: false).getAgentProfileData(context);
    });
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavigationBarProvider, AgentProfileProvider>(
      builder: (context, bottomNavigationBarProvider, agentProfileProvider, child){
        return SafeArea(
          child: Scaffold(
            drawer: MyDrawerPage(),
            key: _scaffoldkey,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColorResources.appBarColor,
              centerTitle: false,
              leading: InkWell(
                  onTap: (){
                    _scaffoldkey.currentState!.openDrawer();
                  },
                  child: Icon(Icons.menu, size: 16.5.sp, color: AppColorResources.secondaryWhite,)),
              title: Text("Wallet", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
            ),
            body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected ?
            NoInternetConnectionWidget(
                onPressed: (){
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("No internet connection!", style: myStyleMontserrat(15.sp, AppColorResources.primaryWhite, FontWeight.w500)),
                    backgroundColor: AppColorResources.redColor,
                  ));
                }
            ):agentProfileProvider.agentProfileModelData != null?Container(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(12),
                      color: AppColorResources.primaryWhite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Available Balance", style: myStyleMontserrat(18.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                          SizedBox(height: 17.5.h,),
                          Row(
                            children: [
                              Text("Tk. ", style: myStyleMontserrat(24, AppColorResources.homeItemColor, FontWeight.w400),),
                              Text("${agentProfileProvider.agentProfileModelData!.data!.walletBalance}", style: myStyleMontserrat(24, AppColorResources.homeItemColor, FontWeight.w600),),
                            ],
                          ),
                          SizedBox(height: 40.h,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(shape: BoxShape.circle,
                                        color: AppColorResources.circleColor),
                                    child: Image.asset("images/arrowright.png", color: AppColorResources.homeItemColor,),
                                  ),
                                  SizedBox(width: 12.h,),
                                  Text("+ 0.00", style: myStyleMontserrat(14, AppColorResources.homeItemColor, FontWeight.w600),),
                                ],
                              ),
                              SizedBox(width: 84.w,),
                              Row(
                                children: [
                                  Container(
                                    height: 32.h,
                                    width: 32.w,
                                    decoration: BoxDecoration(shape: BoxShape.circle,
                                        color: AppColorResources.circleColor),
                                    child: Image.asset("images/arrowbottomleft.png", color: AppColorResources.homeItemColor,),
                                  ),
                                  SizedBox(width: 12.h,),
                                  Text("+ 0.00", style: myStyleMontserrat(14, AppColorResources.homeItemColor, FontWeight.w600),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12.w,right: 12.w,top: 12.h, bottom: 12.h),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("Transaction History", style: myStyleMontserrat(18.sp, AppColorResources.homeItemColor, FontWeight.w500),)),
                    ),
                    ReusableTransactionTablePage(),
                    SizedBox(height: 12.h,),
                    // Padding(
                    //   padding: EdgeInsets.only(left: 12.w,right: 12.w,top: 12.h, bottom: 12.h),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: (){
                    //           setState(() {
                    //             if(count>1){
                    //               count --;
                    //             }
                    //           });
                    //         },
                    //         child: Container(
                    //           alignment: Alignment.center,
                    //           height: 36.h,
                    //           width: 82.w,
                    //           decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(4.r), bottomLeft: Radius.circular(4.r)),
                    //               border: Border.all(width: 1.w, color: AppColorResources.containerBorderColor), color: AppColorResources.primaryWhite),
                    //           child: Text("Previous", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w400),),
                    //         ),
                    //       ),
                    //       Container(
                    //         alignment: Alignment.center,
                    //         padding: EdgeInsets.symmetric(horizontal: 17.w),
                    //         height: 36.h,
                    //         color: AppColorResources.primaryDeepBlue,
                    //         child: Text(count.toString(), style: myStyleMontserrat(14.sp, AppColorResources.countColor, FontWeight.w600),),
                    //       ),
                    //       GestureDetector(
                    //         onTap: (){
                    //           setState(() {
                    //             count ++;
                    //           });
                    //         },
                    //         child: Container(
                    //           alignment: Alignment.center,
                    //           height: 36.h,
                    //           width: 57.w,
                    //           decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(4.r), bottomRight: Radius.circular(4.r)),
                    //               border: Border.all(width: 1.w, color: AppColorResources.containerBorderColor), color: AppColorResources.primaryWhite),
                    //           child: Text("Next", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w400),),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ):Center(child: SizedBox.shrink()),
            bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context,false),
          ),
        );
      }
    );
  }
  int count = 1;
}
