
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/bottom_navigation_bar_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/custom_button.dart';

class UpdateCustomerPage extends StatefulWidget {
  static const String routeName = '/update_customer_page';
  const UpdateCustomerPage({Key? key}) : super(key: key);

  @override
  State<UpdateCustomerPage> createState() => _UpdateCustomerPageState();
}

class _UpdateCustomerPageState extends State<UpdateCustomerPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController thanaController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  final districtItems = ["Dhaka", "Bogura", "Rangpur"];
  final thanaItems = ["Mirpur", "Nandigram", "Kaonia"];
  final areaItems = ["Shewrapara", "Nagorkandi", "Kaonia"];
  String ?_selectedDistrict;
  String ?_selectedThana;
  String ?_selectedArea;

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (BuildContext context, bottomNavigationBarProvider, Widget? child) {
        return Scaffold(
          backgroundColor: AppColorResources.bgColor,
          appBar: AppBar(
            backgroundColor: AppColorResources.appBarColor,
            centerTitle: false,
            leading: InkWell(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_outlined, size: 16.5.sp, color: AppColorResources.secondaryWhite,)),
            title: Text("Update Customer", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
          ),
          body: Container(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
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
                                style: TextStyle(color: AppColorResources.secondaryBlack),
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
                                style: TextStyle(color: AppColorResources.secondaryBlack),
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
                                style: TextStyle(color: AppColorResources.secondaryBlack),
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
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                    color: AppColorResources.textFieldColor),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    iconDisabledColor: AppColorResources.secondaryBlack,
                                    iconEnabledColor: AppColorResources.secondaryBlack,
                                    isExpanded: true,
                                    hint: Text('Select',style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400)), // Not necessary for Option 1
                                    value: _selectedDistrict,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedDistrict = newValue!;
                                      });
                                    },
                                    items: districtItems.map((districtItems) {
                                      return DropdownMenuItem(
                                        child: Text(districtItems, style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),),
                                        value: districtItems,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),SizedBox(height: 10.h,),
                              Text("Customer Thana",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                    color: AppColorResources.textFieldColor),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    iconDisabledColor: AppColorResources.secondaryBlack,
                                    iconEnabledColor: AppColorResources.secondaryBlack,
                                    isExpanded: true,
                                    hint: Text('Select',style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400)), // Not necessary for Option 1
                                    value: _selectedThana,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedThana = newValue!;
                                      });
                                    },
                                    items: thanaItems.map((thanaItems) {
                                      return DropdownMenuItem(
                                        child: Text(thanaItems, style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),),
                                        value: thanaItems,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),SizedBox(height: 10.h,),
                              Text("Customer Area",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 12.w,),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
                                    color: AppColorResources.textFieldColor),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    iconDisabledColor: AppColorResources.secondaryBlack,
                                    iconEnabledColor: AppColorResources.secondaryBlack,
                                    isExpanded: true,
                                    hint: Text('Select',style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400)), // Not necessary for Option 1
                                    value: _selectedArea,
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedArea = newValue!;
                                      });
                                    },
                                    items: areaItems.map((areaItems) {
                                      return DropdownMenuItem(
                                        child: Text(areaItems, style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),),
                                        value: areaItems,
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("Customer Local Address",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: addressController,
                                style: TextStyle(color: AppColorResources.secondaryBlack),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 12.w, right: 12.w, top: 40.h, bottom: 40.h),
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
                            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomerProfilePage()));
                          }, title: "Update"),
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
