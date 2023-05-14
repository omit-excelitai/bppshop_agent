
import 'package:bppshop_agent/view/screens/bottom_nav_bar/order_history_page.dart';
import 'package:bppshop_agent/view/screens/customer_page.dart';
import 'package:bppshop_agent/view/screens/dashboard_page.dart';
import 'package:bppshop_agent/view/screens/my_commission.dart';
import 'package:bppshop_agent/view/screens/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../../utill/app_color_resources.dart';
import '../../../utill/app_style.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/navigation_service_without_context.dart';
import '../../widgets/no_internet_connection_widget.dart';
import '../drawer/my_drawer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    NavigationService routeService = NavigationService();
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return Scaffold(
      drawer: MyDrawerPage(),
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColorResources.appBarColor,
        centerTitle: false,
        leading: InkWell(
            onTap: (){
              _scaffoldKey.currentState!.openDrawer();
            },
            child: Icon(Icons.menu, size: 16.5.sp, color: AppColorResources.secondaryWhite,)),
        title: Text("Home", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
      ):Container(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(children: [
            Row(children: [
              Expanded(
                flex: 2,
                child: CustomHomePageContainer(
                    onTap: (){
                      Navigator.of(context).pushNamed(DashboardPage.routeName);
                    },
                  title: "Dashboard",
                  image: "images/dashboard.png",
                ),
              ),
              SizedBox(width: 12.w,),
              Expanded(
                flex: 2,
                child: CustomHomePageContainer(
                  onTap: (){
                    Navigator.of(context).pushNamed(CustomerPage.routeName);
                  },
                  title: "Customer",
                  image: "images/customer.png",
                ),),
            ],),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: CustomHomePageContainer(
                    onTap: (){
                      Navigator.of(context).pushNamed(OrderHistoryPage.routeName);
                    },
                    title: "Order History",
                    image: "images/clock.png",
                  ),
                ),
                SizedBox(width: 12.w,),
                Expanded(
                  flex: 2,
                  child: CustomHomePageContainer(
                    onTap: (){
                      Navigator.of(context).pushNamed(MyCommissionPage.routeName);
                    },
                    title: "My Commission",
                    image: "images/mycommission.png",
                  ),),
              ],),
            ),
            Row(children: [
              Expanded(
                flex: 2,
                child: CustomHomePageContainer(
                  onTap: (){
                    //routeService.routeTo(CustomerProfilePage.routeName);
                    Navigator.of(context).pushNamed(WalletPage.routeName);
                  },
                  title: "Wallet",
                  image: "images/wallet.png",
                ),
              ),
              SizedBox(width: 12.w,),
              Expanded(
                flex: 2,
                child: Container(),),
            ],),
          ],),
        ),
      ),
    );
  }
}



