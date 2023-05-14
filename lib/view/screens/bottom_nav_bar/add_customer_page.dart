
import 'package:bppshop_agent/provider/add_customer_provider.dart';
import 'package:bppshop_agent/provider/district_thana_area_provider.dart';
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../../utill/app_color_resources.dart';
import '../../../utill/app_style.dart';
import '../../widgets/app_custom_dropdown_button.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/no_internet_connection_widget.dart';

class AddCustomerPage extends StatefulWidget {
  static const String routeName = '/add_customer_page';
  const AddCustomerPage({Key? key}) : super(key: key);

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load(true, context);
     createNewCustomerInfo(context);
    });
    super.initState();
  }

  /// For Load data
  _load(bool reload, BuildContext context) async {
    await Provider.of<DistrictThanaAreaProvider>(context, listen: false)
        .getDistrict(reload, context);
  }

  /// Add New Customer
  createNewCustomerInfo(BuildContext context) async {
    await Provider.of<AddCustomerProvider>(context, listen: false)
        .createNewCustomer(
        customerName: nameController.text.trim(),
        customerEmail: emailController.text.trim(),
        customerMobile: numberController.text.trim(),
        customerAddress: addressController.text.trim(),
        districtId:Provider.of<DistrictThanaAreaProvider>(context, listen: false).districtId,
        thanaId: Provider.of<DistrictThanaAreaProvider>(context, listen: false).thanaId,
        areaId: Provider.of<DistrictThanaAreaProvider>(context, listen: false).areaId,
        context: context);
  }

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
    return Consumer2<DistrictThanaAreaProvider, AddCustomerProvider>(
      builder: (BuildContext context, districtThanaAreaProvider, addCustomerProvider, Widget? child) {
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
            title: Text("Customer", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
                  Row(
                    children: [
                      Text("Add Customer",style: myStyleMontserrat(18.sp, Theme.of(context).highlightColor, FontWeight.w500),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
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
                                  // searchController: _searchController,
                                  // isSearchable: true,
                                  // searchMatchFn: true,

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
                           createNewCustomerInfo(context);
                            //Navigator.of(context).pushNamed(CustomerProfilePage.routeName);
                          }, title: "Add"),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

