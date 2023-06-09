
import 'package:bppshop_agent/provider/update_customer_profile_provider.dart';
import 'package:bppshop_agent/view/screens/customer_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../localization/app_localization.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../provider/district_thana_area_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/app_custom_dropdown_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/navigation_service_without_context.dart';
import '../widgets/no_internet_connection_widget.dart';

class UpdateCustomerPage extends StatefulWidget {
  static const String routeName = '/update_customer_page';
  dynamic customerId, customerName, customerAddress, customerMobile, customerEmail;
  UpdateCustomerPage({Key? key, this.customerId, this.customerName, this.customerAddress, this.customerMobile, this.customerEmail}) : super(key: key);

  @override
  State<UpdateCustomerPage> createState() => _UpdateCustomerPageState();
}

class _UpdateCustomerPageState extends State<UpdateCustomerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  NavigationService routeService = NavigationService();

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = widget.customerName;
      addressController.text = widget.customerAddress;
      numberController.text = widget.customerMobile;
      emailController.text = widget.customerEmail;

      _load(true, context);
    });
    super.initState();
  }

  /// Load District, Thana & Area
  _load(bool reload, BuildContext context) async {
    await Provider.of<DistrictThanaAreaProvider>(context, listen: false)
        .getDistrict(reload, context);
  }

  /// For Update customer profile
  update() async{
    await Provider.of<UpdateCustomerProfileProvider>(context, listen: false).updateCustomerProfile(
        customer_name: nameController.text,
        customer_address: addressController.text,
        customer_id: widget.customerId,
        context: context);
  }

  // updated() async{
  //   await update().then((){
  //     return routeService.routeTo(CustomerProfilePage.routeName, arguments: widget.customerId.toString());
  //   });
  // }



  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavigationBarProvider, DistrictThanaAreaProvider>(
      builder: (BuildContext context, bottomNavigationBarProvider, districtThanaAreaProvider, Widget? child) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: AppColorResources.appBarColor,
            centerTitle: false,
            leading: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_outlined, size: 16.5.sp, color: AppColorResources.secondaryWhite,)),
            title: Text(AppLocalizations.of(context)!.update_customer.toString(), style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0.r), color: Theme.of(context).cardColor),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Customer Name",style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: nameController,
                                style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 12.w, right: 12.w),
                                  hintText: "Enter Name",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  filled: true,
                                  fillColor: AppColorResources.textFieldColor,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8.r)),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("Customer Mobile",style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              TextFormField(
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                controller: numberController,
                                style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 12.w, right: 12.w),
                                  hintText: "Enter Number",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  filled: true,
                                  fillColor: AppColorResources.textFieldColor,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8.r)),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("Customer Email",style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              TextFormField(
                                readOnly: true,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                controller: emailController,
                                style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 12.w, right: 12.w),
                                  hintText: "example@gmail.com",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  filled: true,
                                  fillColor: AppColorResources.textFieldColor,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8.r)),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("Customer District",style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              districtThanaAreaProvider.districtNameList != null?Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                    color: AppColorResources.textFieldColor),
                                child: CustomDropDown(
                                  items: districtThanaAreaProvider.districtNameList,
                                  width: double.infinity,
                                  dropDownWidth: 280.w,
                                  height: 55.h,
                                  isExpanded: true,
                                  selectedStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  hint: "Select District",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  onChanged: (value) {
                                    districtThanaAreaProvider.thanaNameList!.clear();
                                    districtThanaAreaProvider.areaNameList!.clear();
                                    districtThanaAreaProvider.changeDistrictDropDownValue(value!);
                                    districtThanaAreaProvider.getThana(true, context);
                                    districtThanaAreaProvider.thanaDropdownValue = null;
                                    districtThanaAreaProvider.areaDropdownValue = null;
                                  },
                                  selectedValue: districtThanaAreaProvider.districtDropdownValue,
                                ),
                              ): Center(child: Text(" ")),
                              SizedBox(height: 10.h,),
                              Text("Customer Thana",style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              districtThanaAreaProvider.thanaNameList != null?Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                    color: AppColorResources.textFieldColor),
                                child: CustomDropDown(
                                  items: districtThanaAreaProvider.thanaNameList,
                                  width: double.infinity,
                                  dropDownWidth: 280.w,
                                  height: 55.h,
                                  isExpanded: true,
                                  selectedStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  hint: "Select Thana",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  onChanged: (value) {
                                    districtThanaAreaProvider.areaNameList!.clear();
                                    districtThanaAreaProvider.changeThanaDropDownValue(value!);
                                    districtThanaAreaProvider.getArea(true, context);
                                    districtThanaAreaProvider.areaDropdownValue = null;
                                  },
                                  selectedValue: districtThanaAreaProvider.thanaDropdownValue,
                                ),
                              ): Center(child: Text(" ")),
                              SizedBox(height: 10.h,),
                              Text("Customer Area",style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              districtThanaAreaProvider.areaNameList != null?Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                    color: AppColorResources.textFieldColor),
                                child: CustomDropDown(
                                  items: districtThanaAreaProvider.areaNameList,
                                  width: double.infinity,
                                  dropDownWidth: 280.w,
                                  height: 55.h,
                                  isExpanded: true,
                                  selectedStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  hint: "Select Area",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  onChanged: (value) {
                                    districtThanaAreaProvider.changeAreaDropDownValue(value!);
                                  },
                                  selectedValue: districtThanaAreaProvider.areaDropdownValue,
                                ),
                              ): Center(child: Text(" ")),
                              SizedBox(height: 10.h,),
                              Text("Customer Local Address",style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: addressController,
                                style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 12.w, right: 12.w, top: 30.h, bottom: 30.h),
                                  hintText: "16/1 (9th Floor), Alhaz Shamsuddin Mansion, New Eskaton Garden Road",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  hintMaxLines: 2,
                                  filled: true,
                                  fillColor: AppColorResources.textFieldColor,
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius: BorderRadius.circular(8.r)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 18.h,),
                        Align(
                          alignment: Alignment.topRight,
                          child: AddandUpdateButton(onTap: (){
                            update();
                            routeService.routeTo(CustomerProfilePage.routeName, arguments: widget.customerId.toString());
                          }, title: AppLocalizations.of(context)!.update.toString()),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context,false),
        );
      },
    );
  }
}
