
import 'package:bppshop_agent/provider/agent_dashboard_provider.dart';
import 'package:bppshop_agent/view/screens/bottom_nav_bar/agent_profile_page.dart';
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../provider/agent_profile_provider.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/no_internet_connection_widget.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard_page';
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load(context, true);
    });
    super.initState();
  }

  _load(BuildContext context, bool reload) async{
    await Provider.of<AgentProfileProvider>(context, listen: false).getAgentProfileData(context);
    await Provider.of<AgentDashboardProvider>(context, listen: false).getAgentDashboard(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavigationBarProvider, AgentDashboardProvider>(
      builder: (context, bottomNavigationBarProvider, agentDashboardProvider, child){
        return RefreshIndicator(
          color: AppColorResources.primaryWhite,
          backgroundColor: AppColorResources.RefreshIndicator,
          onRefresh: () {
            _load(context, true);
            return Future<void>.delayed(const Duration(seconds: 2));
          },
          child: Scaffold(
            drawer: MyDrawerPage(),
            key: _scaffoldkey,
            backgroundColor: AppColorResources.bgColor,
            appBar: AppBar(
              backgroundColor: AppColorResources.appBarColor,
              centerTitle: false,
              leading: InkWell(
                  onTap: (){
                    _scaffoldkey.currentState!.openDrawer();
                  },
                  child: Icon(Icons.menu, size: 16.5.sp, color: AppColorResources.secondaryWhite,)),
              title: Text("Dashboard", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
            ),
            body: Provider.of<InternetConnectionStatus>(context) ==
                InternetConnectionStatus.disconnected ?
            NoInternetConnectionWidget(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("No internet connection!", style: myStyleMontserrat(15.sp, AppColorResources.primaryWhite, FontWeight.w500)),
                    backgroundColor: AppColorResources.redColor,
                  ));
                }
            ):agentDashboardProvider.agentDashboardModelData != null?Container(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ProfileSection(),
                    Container(
                      margin: EdgeInsets.only(bottom: 12.h),
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      color: AppColorResources.primaryWhite,
                      child: Column(
                        children: [
                          Row(children: [
                            Expanded(
                              flex: 2,
                              child: DashboardCustomContainer(onTap: (){}, title: "Total Customer", amount: "${agentDashboardProvider.agentDashboardModelData!.data!.totalCustomers}", image: "images/totalcustomer.png", color: AppColorResources.primaryOrange,),
                            ),
                            SizedBox(width: 12.w,),
                            Expanded(
                              flex: 2,
                              child: DashboardCustomContainer(onTap: (){}, title: "Total Withdraw", amount: "${agentDashboardProvider.agentDashboardModelData!.data!.totalWithdraw}", image: "images/withdraw.png", color: AppColorResources.primaryNaviBlue,),),
                          ],),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Row(children: [
                              Expanded(
                                flex: 2,
                                child: DashboardCustomContainer(onTap: (){}, title: "Total Sale Amount", amount: "৳${agentDashboardProvider.agentDashboardModelData!.data!.totalSaleAmount}", image: "images/cashcoin.png", color: AppColorResources.primaryGreen,),
                              ),
                              SizedBox(width: 12.w,),
                              Expanded(
                                flex: 2,
                                child: DashboardCustomContainer(onTap: (){}, title: "Total Orders", amount: "${agentDashboardProvider.agentDashboardModelData!.data!.totalOrders}", image: "images/cartcheck.png", color: AppColorResources.beguniColor,),),
                            ],),
                          ),
                          Row(children: [
                            Expanded(
                              flex: 2,
                              child: DashboardCustomContainer(onTap: (){}, title: "Total Commission", amount: "৳${agentDashboardProvider.agentDashboardModelData!.data!.totalCommission}", image: "images/cashstack.png", color: AppColorResources.lightGreen,),
                            ),
                            SizedBox(width: 12.w,),
                            Expanded(
                              flex: 2,
                              child: DashboardCustomContainer(onTap: (){}, title: "Total Purchase", amount: "${agentDashboardProvider.agentDashboardModelData!.data!.totalPurchase}", image: "images/cartplus.png", color: AppColorResources.secondaryRed,),),
                          ],),
                        ],
                      ),
                    ),
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
}

