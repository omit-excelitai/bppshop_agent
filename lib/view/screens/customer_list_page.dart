
import 'package:bppshop_agent/view/screens/bottom_nav_bar/add_customer_page.dart';
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../provider/customer_list_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/customer_list_table.dart';

class CustomerListPage extends StatefulWidget {
  static const String routeName = '/customer_list_page';
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  TextEditingController searchController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _load(true, context);
  //   });
  // }
  //
  // _load(bool reLoad, BuildContext context){
  //   Provider.of<CustomerListProvider>(context, listen: false).customerAllList(pageNo: 1, no_of_rows: 5, context: context);
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, bottomNavigationBarProvider, child){
        return Scaffold(
          drawer: MyDrawerPage(),
          key: _scaffoldKey,
          backgroundColor: AppColorResources.bgColor,
          appBar: AppBar(
            backgroundColor: AppColorResources.appBarColor,
            centerTitle: false,
            leading: InkWell(
                onTap: (){
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: Icon(Icons.menu, size: 16.5.sp, color: AppColorResources.secondaryWhite,)),
            title: Text("Customer", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 12.w,right: 12.w,top: 12.h,bottom: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Customer List", style: myStyleMontserrat(18.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(AddCustomerPage.routeName);
                        },
                        child: Container(
                          height: 36.h,
                          width: 183.w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                              color: AppColorResources.primaryBlue),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/personfilladd.png", color: AppColorResources.primaryWhite, height: 24.h, width: 24.w,),
                              SizedBox(width: 10.w,),
                              Text("Add New Customer", style: myStyleMontserrat(12.sp, AppColorResources.primaryWhite, FontWeight.w600),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 12.w,right: 12.w,bottom: 12.h),
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
                CustomerListTable(),
                SizedBox(height: 12.h,),
                // Padding(
                //   padding: EdgeInsets.only(left: 12.w,right: 12.w,top: 12.h,bottom: 12.h),
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
          bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context, false),
        );
      }
    );
  }
}
