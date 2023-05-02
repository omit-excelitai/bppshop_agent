
import 'package:bppshop_agent/provider/customer_details_provider.dart';
import 'package:bppshop_agent/view/screens/update_customer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/no_internet_connection_widget.dart';

class CustomerProfilePage extends StatefulWidget {
  static const String routeName = '/customer_profile_page';

  @override
  State<CustomerProfilePage> createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load(true, context);
    });
  }

  _load(bool reLoad, BuildContext context) async{
    dynamic customerId = ModalRoute.of(context)!.settings.arguments as String;
    await Provider.of<CustomerDetailsProvider>(context, listen: false).fetchCustomerDetailsData(context, id: customerId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavigationBarProvider, CustomerDetailsProvider>(
      builder: (BuildContext context, bottomNavigationBarProvider, customerDetailsProvider, Widget? child) {
        return RefreshIndicator(
            color: AppColorResources.primaryWhite,
            backgroundColor: AppColorResources.RefreshIndicator,
            onRefresh: () {
              _load(true, context);
              return Future<void>.delayed(const Duration(seconds: 2));
        },
          child: Scaffold(
            backgroundColor: AppColorResources.bgColor,
            appBar: AppBar(
              backgroundColor: AppColorResources.appBarColor,
              centerTitle: false,
              leading: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back_outlined, size: 16.5.sp, color: AppColorResources.secondaryWhite,)),
              title: Text("Customer Profile", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
            ):customerDetailsProvider.customerDetailsResponseModel != null?Container(
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.h),
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      color: AppColorResources.primaryWhite,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 116.h,
                                    width: 116.w,
                                    decoration: BoxDecoration(shape: BoxShape.circle,
                                        //color: AppColorResources.primaryOrange,
                                    image: DecorationImage(image: AssetImage("images/customerpic.png",)),),
                                  ),
                                ),
                                flex: 2,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Customer ID:", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w400),),
                                    Text("${customerDetailsProvider.customerDetailsResponseModel!.data!.id}", style: myStyleMontserrat(24.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                                  ],
                                ),
                                flex: 2,),
                            ],
                          ),
                          SizedBox(height: 12.h,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("CONTACT INFORMATION:", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                                ListTile(
                                  title: Text("Customer Name", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                                  subtitle: Text("${customerDetailsProvider.customerDetailsResponseModel!.data!.customerName}", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                                ),
                                ListTile(
                                  title: Text("Email", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                                  subtitle: Text("${customerDetailsProvider.customerDetailsResponseModel!.data!.customerEmail}", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                                ),
                                ListTile(
                                  title: Text("Mobile", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                                  subtitle: Text("${customerDetailsProvider.customerDetailsResponseModel!.data!.customerMobile}", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                                ),
                                ListTile(
                                  title: Text("Address", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                                  subtitle: Text("${customerDetailsProvider.customerDetailsResponseModel!.data!.customerAddress}", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                                ),
                                SizedBox(height: 12.h,),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>UpdateCustomerPage(
                                      customerId: customerDetailsProvider.customerDetailsResponseModel!.data!.id,
                                      customerName: customerDetailsProvider.customerDetailsResponseModel!.data!.customerName,
                                      customerAddress: customerDetailsProvider.customerDetailsResponseModel!.data!.customerAddress,
                                      customerMobile: customerDetailsProvider.customerDetailsResponseModel!.data!.customerMobile,
                                      customerEmail: customerDetailsProvider.customerDetailsResponseModel!.data!.customerEmail,
                                      )));
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 36.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                      color: AppColorResources.primaryBlue,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset("images/edit.png"),
                                        Text("Update Customer", style: myStyleMontserrat(12.sp, AppColorResources.secondaryWhite, FontWeight.w600),),
                                      ],
                                    ),
                                  ),
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
            ):Center(child: SizedBox.shrink()),
            bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context,false),
          ),
        );
      },
    );
  }
}
