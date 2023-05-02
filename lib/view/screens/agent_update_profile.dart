
import 'dart:io';

import 'package:bppshop_agent/provider/agent_profile_provider.dart';
import 'package:bppshop_agent/provider/update_agent_profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../provider/district_thana_area_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/app_custom_dropdown_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/no_internet_connection_widget.dart';

class AgentUpdateProfile extends StatefulWidget {
  static const String routeName = '/agent_update_profile';
  dynamic agentName, agentMobile, agentEmail, agentAddress, districtId, thanaId, areaId;
  AgentUpdateProfile({Key? key, this.agentName, this.agentMobile, this.agentEmail, this.agentAddress, this.districtId, this.thanaId, this.areaId}) : super(key: key);

  @override
  State<AgentUpdateProfile> createState() => _AgentUpdateProfileState();
}

class _AgentUpdateProfileState extends State<AgentUpdateProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  /// For pick image
  XFile? _chooseImage;

  chooseImageFromGallery() async {
    ImagePicker _picker = ImagePicker();
    _chooseImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nameController.text = widget.agentName;
      addressController.text = widget.agentAddress;
      numberController.text = widget.agentMobile;
      emailController.text = widget.agentEmail;
      Provider.of<DistrictThanaAreaProvider>(context, listen: false).districtDropdownValue = Provider.of<AgentProfileProvider>(context, listen: false).agentProfileModelData!.data!.districtName;
      Provider.of<DistrictThanaAreaProvider>(context, listen: false).thanaDropdownValue = Provider.of<AgentProfileProvider>(context, listen: false).agentProfileModelData!.data!.thanaName;
      Provider.of<DistrictThanaAreaProvider>(context, listen: false).areaDropdownValue = Provider.of<AgentProfileProvider>(context, listen: false).agentProfileModelData!.data!.areaName;
      _load(true, context);
    });
    super.initState();
  }

  /// Load District, Thana & Area
  _load(bool reload, BuildContext context) async {
    await Provider.of<DistrictThanaAreaProvider>(context, listen: false)
        .getDistrict(reload, context);
  }

  /// For Update Agent Profile
  updateAgent() async{
    await Provider.of<UpdateAgentProfileProvider>(context, listen: false).updateAgentProfile(
        agent_name: nameController.text.toString(),
        district_id: Provider.of<DistrictThanaAreaProvider>(context,listen: false).districtId,
        thana_id: Provider.of<DistrictThanaAreaProvider>(context,listen: false).thanaId,
        area_id: Provider.of<DistrictThanaAreaProvider>(context,listen: false).areaId,
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
    return Consumer2<BottomNavigationBarProvider, DistrictThanaAreaProvider>(
      builder: (BuildContext context, bottomNavigationBarProvider, districtThanaAreaProvider, Widget? child) {
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
            title: Text("Update Agent Profile", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0.r), color: AppColorResources.primaryWhite),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipOval(
                              child: _chooseImage == null?Image.asset("images/customerpic.png",height: 116.h, width: 102.w, fit: BoxFit.cover,):Image.file(File(_chooseImage!.path),height: 116.h, width: 102.w, fit: BoxFit.cover,),
                            ),
                            // Container(
                            //   height: 116.h,
                            //   width: 116.w,
                            //   decoration: BoxDecoration(shape: BoxShape.circle,
                            //       //color: AppColorResources.primaryOrange,
                            //   image: DecorationImage(image: _chooseImage == null ? AssetImage("images/customerpic.png"):)
                            //   ),
                            //   //child: _chooseImage == null?Image.asset("images/customerpic.png", fit: BoxFit.cover,):Image.file(File(_chooseImage!.path), fit: BoxFit.cover,),
                            // ),
                            Positioned(
                                bottom: 1.h,
                                left: 0.w,
                                right: 0.w,
                                child: Image.asset("images/uap.png", height: 40.h, width: 73.48.w,)),
                            Positioned(
                                bottom: -20.h,
                                left: 0,
                                right: 0,
                                child: GestureDetector(
                                  onTap: (){
                                    chooseImageFromGallery();
                                  },
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    padding: EdgeInsets.only(top: 8.h),
                                    height: 61.h,
                                    width: 74.w,
                                    decoration: BoxDecoration(shape: BoxShape.circle,),
                                    child: Image.asset("images/edit.png" , height: 24.h, width: 24.w,),
                                  ),
                                )),
                          ],
                        ),
                        SizedBox(height: 24.h,),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Agent Name",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                              Text("Agent Mobile",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                              Text("Agent Email",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
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
                              Text("Agent District",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              Container(
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
                                  hint: "${Provider.of<AgentProfileProvider>(context, listen: false).agentProfileModelData!.data!.districtName}",
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
                                )),
                               SizedBox(height: 10.h,),
                              Text("Agent Thana",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              Container(
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
                                  hint: "${Provider.of<AgentProfileProvider>(context, listen: false).agentProfileModelData!.data!.thanaName}",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  onChanged: (value) {
                                    districtThanaAreaProvider.areaNameList!.clear();
                                    districtThanaAreaProvider.changeThanaDropDownValue(value!);
                                    districtThanaAreaProvider.getArea(true, context);
                                    districtThanaAreaProvider.areaDropdownValue = null;
                                  },
                                  selectedValue: districtThanaAreaProvider.thanaDropdownValue,
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("Agent Area",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              Container(
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
                                  hint: "${Provider.of<AgentProfileProvider>(context, listen: false).agentProfileModelData!.data!.areaName}",
                                  hintStyle: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                  onChanged: (value) {
                                    districtThanaAreaProvider.changeAreaDropDownValue(value!);
                                  },
                                  selectedValue: districtThanaAreaProvider.areaDropdownValue,
                                ),
                              ),
                              SizedBox(height: 10.h,),
                              Text("Agent Local Address",style: myStyleMontserrat(12.sp, AppColorResources.primaryBlack, FontWeight.w400),),
                              SizedBox(height: 4.h,),
                              TextFormField(
                                readOnly: true,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                controller: addressController,
                                style: myStyleMontserrat(14.sp, AppColorResources.secondaryBlack, FontWeight.w400),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 12.w, right: 12.w, top: 30.h, bottom: 30.h),
                                  hintText: " ",
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
                            updateAgent();
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
