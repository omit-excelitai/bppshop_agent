
import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:bppshop_agent/view/screens/agent_update_profile.dart';
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utill/app_color_resources.dart';
import '../../../utill/app_style.dart';
import '../../widgets/custom_circular_progress_indicator.dart';

class AgentProfilePage extends StatefulWidget {
  static const String routeName = '/agent_profile_page';
  const AgentProfilePage({Key? key}) : super(key: key);

  @override
  State<AgentProfilePage> createState() => _AgentProfilePageState();
}

class _AgentProfilePageState extends State<AgentProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //final authProvider = Provider.of<AuthProvider>(context);

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
        title: Text("Agent Profile", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileSection extends StatefulWidget {

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  void initState() {
    Provider.of<AgentProfileProvider>(context, listen: false).getAgentProfileData();
    super.initState();
  }

  List<AgentProfileModel> agentProfileData = [];

  @override
  Widget build(BuildContext context) {
    agentProfileData = Provider.of<AgentProfileProvider>(context).agentProfileData;

    return agentProfileData.isNotEmpty?Container(
      margin: EdgeInsets.symmetric(vertical: 12.h),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      color: AppColorResources.primaryWhite,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 116.h,
                      width: 116.w,
                      decoration: BoxDecoration(shape: BoxShape.circle,
                      image: DecorationImage(image: NetworkImage("${AppConstants.imageUrl}${agentProfileData[0].data!.image}",)),
                      color: AppColorResources.primaryOrange),
                    ),
                  ),
              flex: 2,),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(AgentUpdateProfile.routeName);
                        },
                          child: Image.asset("images/edit.png", height: 32.h, width: 32.h,)),
                      SizedBox(height: 16.h,),
                      Text("${agentProfileData[0].data!.name}", style: myStyleMontserrat(16.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                      Text("${agentProfileData[0].data!.email}", style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w400),),
                    ],
                  ),
              flex: 2,),
            ],
          ),
          SizedBox(height: 12.h,),
          Divider(
            endIndent: 0,
            indent: 0,
            thickness: 1.h,
            color: AppColorResources.bottomLabelColor,
          ),
          Text("Balance", style: myStyleMontserrat(16.sp, AppColorResources.homeItemColor, FontWeight.w600),),
          Text("৳${agentProfileData[0].data!.walletBalance}", style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w500),),
          Divider(
            endIndent: 0,
            indent: 0,
            thickness: 1.h,
            color: AppColorResources.bottomLabelColor,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Role: ${agentProfileData[0].role}", style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                SizedBox(height: 8.h,),
                Text("CONTACT INFORMATION:", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                // SizedBox(height: 12.h,),
                // Row(children: [
                //   Image(image: AssetImage("images/call.png"),),
                //   SizedBox(width: 12.w,),
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Mobile", style: myStyleMontserrat(14.sp, homeItemColor, FontWeight.w600),),
                //       Text("01711369672", style: myStyleMontserrat(14.sp, homeItemColor, FontWeight.w600),),
                //     ],
                //   )
                // ],),Row(children: [
                //   Image(image: AssetImage("images/mail.png"),),
                //   SizedBox(width: 12.w,),
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Email", style: myStyleMontserrat(14.sp, homeItemColor, FontWeight.w600),),
                //       Text("mahmum@gmail.com", style: myStyleMontserrat(14.sp, homeItemColor, FontWeight.w600),),
                //     ],
                //   )
                // ],),Row(children: [
                //   Image(image: AssetImage("images/call.png"),),
                //   SizedBox(width: 12.w,),
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Address", style: myStyleMontserrat(14.sp, homeItemColor, FontWeight.w600),),
                //       subtitle: Text("16/1 (9th Floor), Alhaz Shamsuddin Mansion, New Eskaton Garden Road,", style: myStyleMontserrat(14.sp, homeItemColor, FontWeight.w600),),
                //     ],
                //   )
                // ],),
                ListTile(
                  leading: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Image.asset("images/call.png")),
                  title: Text("Mobile", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                  subtitle: Text("${agentProfileData[0].data!.phone}", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                ),
                ListTile(
                  leading: Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: Image.asset("images/mail.png")),
                  title: Text("Email", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                  subtitle: Text("${agentProfileData[0].data!.email}", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                ),
                ListTile(
                  leading: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Image.asset("images/home.png")),
                  title: Text("Address", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                  subtitle: Text("${agentProfileData[0].data!.address}", style: myStyleMontserrat(14.sp, AppColorResources.homeItemColor, FontWeight.w600),),
                ),
              ],
            ),
          ),
        ],
      ),
    ):Center(
      child: customCircularProgressIndicator(),
    );
  }
}
