
import 'package:bppshop_agent/provider/add_customer_provider.dart';
import 'package:bppshop_agent/provider/district_thana_area_provider.dart';
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:bppshop_agent/view/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utill/app_color_resources.dart';
import '../../../utill/app_style.dart';
import '../../widgets/app_custom_dropdown_button.dart';
import '../../widgets/custom_button.dart';
import '../customer_profile_page.dart';

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
      // Provider.of<DistrictThanaAreaProvider>(context, listen: false).getDistrict(true, context);
      // Provider.of<DistrictThanaAreaProvider>(context, listen: false).getThana(true, context);
      // Provider.of<DistrictThanaAreaProvider>(context, listen: false).getArea(true, context);
      //Provider.of<DistrictThanaAreaProvider>(context, listen: false).clearData();
      _load(true, context);
      createNewCustomer();
    });
    super.initState();
  }

  _load(bool reload, BuildContext context) async {
    await Provider.of<DistrictThanaAreaProvider>(context, listen: false)
        .getDistrict(reload, context);
  }

  createNewCustomer() async {
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

    return Consumer<DistrictThanaAreaProvider>(
      builder: (BuildContext context, districtThanaAreaProvider, Widget? child) {
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
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("Add Customer",style: myStyleMontserrat(18.sp, AppColorResources.primaryBlack, FontWeight.w500),),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0.r), color: AppColorResources.primaryWhite),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Customer Name",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                              Text("Customer Mobile",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                              Text("Customer Email",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                              Text("Customer District",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              // districtThanaAreaProvider.districtDataList != null?Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 12.w,),
                              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                              //       color: AppColorResources.textFieldColor),
                              //   child: DropdownButtonHideUnderline(
                              //     child: DropdownButton(
                              //       iconDisabledColor: AppColorResources.secondaryBlack,
                              //       iconEnabledColor: AppColorResources.secondaryBlack,
                              //       isExpanded: true,
                              //       hint: Text('Select',style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400)), // Not necessary for Option 1
                              //       value: districtThanaAreaProvider.getDistrictDropdownValue,
                              //       onChanged: (value) {
                              //         districtThanaAreaProvider.changeDistrictDropDownValue(value);
                              //       },
                              //       items: districtThanaAreaProvider.districtDataList!.map((district) {
                              //         return DropdownMenuItem(
                              //             child: Text("${district.name}", style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),),
                              //             value: district.name
                              //         );
                              //       }).toList(),
                              //     ),
                              //   ),
                              // ): Center(child: customCircularProgressIndicator()),

                              districtThanaAreaProvider.districtNameList != null?Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                    color: AppColorResources.textFieldColor),
                                child: CustomDropDown(
                                  searchController: _searchController,
                                  searchInnerWidget: TextFormField(
                                    enabled: true,
                                    controller: _searchController,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Select mood...',
                                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8,),
                                      filled: true,
                                    ),
                                  ),
                                  searchMatchFn: (item, searchValue) {
                                    return (item.value.toString().contains(searchValue));
                                  },
                                  onMenuStateChange: (isOpen) {
                                    if (!isOpen) {
                                      _searchController.clear();
                                    }
                                  },

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
                              Text("Customer Thana",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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

                              // districtThanaAreaProvider.thanaDataList != null?Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 12.w,),
                              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                              //       color: AppColorResources.textFieldColor),
                              //   child: DropdownButtonHideUnderline(
                              //     child: DropdownButton(
                              //       iconDisabledColor: AppColorResources.secondaryBlack,
                              //       iconEnabledColor: AppColorResources.secondaryBlack,
                              //       isExpanded: true,
                              //       hint: Text('Select',style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400)), // Not necessary for Option 1
                              //       value: districtThanaAreaProvider.thanaDropdownValue,
                              //       onChanged: (newValue) {
                              //         districtThanaAreaProvider.changeThanaDropDownValue(newValue as String);
                              //       },
                              //       items: districtThanaAreaProvider.thanaDataList!.map((thanaData) {
                              //         return DropdownMenuItem(
                              //           child: Text("${thanaData.name}", style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),),
                              //           value: thanaData.id,
                              //         );
                              //       }).toList(),
                              //     ),
                              //   ),
                              // ):Center(child: customCircularProgressIndicator()),
                              SizedBox(height: 10.h,),
                              Text("Customer Area",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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

                              // districtThanaAreaProvider.areaDataList != null?Container(
                              //   padding: EdgeInsets.symmetric(horizontal: 12.w,),
                              //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                              //       color: AppColorResources.textFieldColor),
                              //   child: DropdownButtonHideUnderline(
                              //     child: DropdownButton(
                              //       iconDisabledColor: AppColorResources.secondaryBlack,
                              //       iconEnabledColor: AppColorResources.secondaryBlack,
                              //       isExpanded: true,
                              //       hint: Text('Select',style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400)), // Not necessary for Option 1
                              //       value: districtThanaAreaProvider.areaDropdownValue,
                              //       onChanged: (newValue) {
                              //         districtThanaAreaProvider.changeAreaDropDownValue(newValue as String);
                              //       },
                              //       items: districtThanaAreaProvider.areaDataList!.map((areaData) {
                              //         return DropdownMenuItem(
                              //           child: Text("${areaData.name}", style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),),
                              //           value: areaData.id,
                              //         );
                              //       }).toList(),
                              //     ),
                              //   ),
                              // ):Center(child: customCircularProgressIndicator()),
                              SizedBox(height: 10.h,),
                              Text("Customer Local Address",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                            createNewCustomer();
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

