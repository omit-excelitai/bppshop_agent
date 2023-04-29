import 'package:bppshop_agent/provider/bottom_navigation_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import 'drawer/my_drawer.dart';

class OrderDetailsPage extends StatefulWidget {
  static const String routeName = '/order_details_page';
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
        builder: (BuildContext context, bottomNavigationBarProvider, Widget? child) {
          return Scaffold(
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
              title: Text("Order Details", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                  //   child: Row(
                  //     children: [
                  //       Text("Order Details",style: myStyleMontserrat(18.sp, AppColorResources.primaryBlack, FontWeight.w500),),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    color: AppColorResources.primaryWhite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Customer Name: shopon", style: myStyleMontserrat(16.sp, AppColorResources.primaryBlack, FontWeight.w600),),
                        Row(
                          mainAxisAlignment: ,
                          children: [
                            Row(
                              children: [
                                Text("Order Id: ", style: myStyleMontserrat(15.sp, AppColorResources.primaryBlack, FontWeight.w600),),
                                Text("101767", style: myStyleMontserrat(14.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              ],
                            ),
                            Row(
                              children: [
                                Text("Order Date: ", style: myStyleMontserrat(15.sp, AppColorResources.primaryBlack, FontWeight.w600),),
                                Text("05-04-2023 05:00PM", style: myStyleMontserrat(14.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context, false),
          );
        }
      );
  }
}
