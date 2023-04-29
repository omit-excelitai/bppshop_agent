
import 'package:bppshop_agent/provider/update_customer_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/custom_button.dart';

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

  final districtItems = ["Dhaka", "Bogura", "Rangpur"];
  final thanaItems = ["Mirpur", "Nandigram", "Kaonia"];
  final areaItems = ["Shewrapara", "Nagorkandi", "Kaonia"];
  String ?_selectedDistrict;
  String ?_selectedThana;
  String ?_selectedArea;
  
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = widget.customerName;
      addressController.text = widget.customerAddress;
      numberController.text = widget.customerMobile;
      emailController.text = widget.customerEmail;
    });
    super.initState();
  }

  /// Update customer profile
  update() async{
    await Provider.of<UpdateCustomerProfileProvider>(context, listen: false).updateCustomerProfile(
        customer_name: nameController.text,
        customer_address: addressController.text,
        customer_id: widget.customerId,
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
                                //initialValue: widget.customerName,
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
                                //focusNode: FocusNode,
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
                              Text("Customer Email",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                                //initialValue: widget.customerAddress,
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
