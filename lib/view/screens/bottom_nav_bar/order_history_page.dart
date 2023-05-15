
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../../localization/app_localization.dart';
import '../../../provider/bottom_navigation_bar_provider.dart';
import '../../../utill/app_color_resources.dart';
import '../../../utill/app_style.dart';
import '../../widgets/no_internet_connection_widget.dart';
import '../../widgets/order_history_table.dart';
import '../drawer/my_drawer.dart';

class OrderHistoryPage extends StatefulWidget {
  static const String routeName = '/order_history_page';
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
        builder: (context, bottomNavigationBarProvider, child){
          return SafeArea(
            child: Scaffold(
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
                title: Text(AppLocalizations.of(context)!.order_history.toString(), style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
              ):SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                      child: TextFormField(
                        controller: searchController,
                        style: TextStyle(color: AppColorResources.secondaryBlack),
                        decoration: InputDecoration(
                          prefixIcon: Image.asset("images/search.png"),
                          contentPadding: EdgeInsets.only(left: 12.w, right: 12.w),
                          hintText: "Search customer name/id",
                          hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w500),
                          filled: true,
                          fillColor: AppColorResources.primaryWhite,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.w, color: AppColorResources.textFieldBorderColor),
                              borderRadius: BorderRadius.circular(8.r)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 1.w, color: AppColorResources.textFieldBorderColor),
                              borderRadius: BorderRadius.circular(8.r)),
                        ),
                      ),
                    ),
                    OrderHistoryTable(),
                    SizedBox(height: 12.h,),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(12.w, 12.h, 12.w, 12.h),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     children: [
                    //       GestureDetector(
                    //         onTap: (){},
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
                    //         child: Text("1", style: myStyleMontserrat(14.sp, AppColorResources.countColor, FontWeight.w600),),
                    //       ),
                    //       GestureDetector(
                    //         onTap: (){},
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
              //bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context,true),
            ),
          );
        }
    );
  }
}
