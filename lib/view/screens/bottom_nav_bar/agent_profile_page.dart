
import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:bppshop_agent/view/screens/agent_update_profile.dart';
import 'package:bppshop_agent/view/screens/drawer/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../../localization/app_localization.dart';
import '../../../provider/agent_profile_provider.dart';
import '../../../utill/app_color_resources.dart';
import '../../../utill/app_style.dart';
import '../../widgets/no_internet_connection_widget.dart';

class AgentProfilePage extends StatefulWidget {
  static const String routeName = '/agent_profile_page';
  const AgentProfilePage({Key? key}) : super(key: key);

  @override
  State<AgentProfilePage> createState() => _AgentProfilePageState();
}

class _AgentProfilePageState extends State<AgentProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load(context, true);
    });
    super.initState();
  }

  _load(BuildContext context, bool reload) async{
    await Provider.of<AgentProfileProvider>(context, listen: false).getAgentProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColorResources.primaryWhite,
      backgroundColor: AppColorResources.RefreshIndicator,
      onRefresh: () {
        _load(context, true);
        return Future<void>.delayed(const Duration(seconds: 2));
      },
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
          title: Text(AppLocalizations.of(context)!.agent_profile.toString(), style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                ProfileSection(),
              ],
            ),
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadAgentProfileData(context, true);
    });
    super.initState();
  }

  loadAgentProfileData(BuildContext context, bool reload) async{
    await Provider.of<AgentProfileProvider>(context, listen: false).getAgentProfileData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AgentProfileProvider>(
      builder: (context, agentProfileProvider, child){
        return RefreshIndicator(
          color: AppColorResources.primaryWhite,
          backgroundColor: AppColorResources.RefreshIndicator,
          onRefresh: () {
            loadAgentProfileData(context, true);
            return Future<void>.delayed(const Duration(seconds: 2));
          },
          child: agentProfileProvider.agentProfileModelData != null?Container(
            margin: EdgeInsets.symmetric(vertical: 12.h),
            padding: EdgeInsets.all(12),
            width: double.infinity,
            color: Theme.of(context).cardColor,
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
                              image: DecorationImage(image: NetworkImage("${AppConstants.imageUrl}${agentProfileProvider.agentProfileModelData!.data!.image}",)),
                              //color: AppColorResources.primaryOrange
                            ),
                        ),
                      ),
                      flex: 2,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AgentUpdateProfile(
                                  agentName: agentProfileProvider.agentProfileModelData!.data!.name,
                                  agentMobile: agentProfileProvider.agentProfileModelData!.data!.phone,
                                  agentEmail: agentProfileProvider.agentProfileModelData!.data!.email,
                                  agentAddress: agentProfileProvider.agentProfileModelData!.data!.address,
                                  districtId: agentProfileProvider.agentProfileModelData!.data!.districtId,
                                  thanaId: agentProfileProvider.agentProfileModelData!.data!.thanaId,
                                  areaId: agentProfileProvider.agentProfileModelData!.data!.areaId,
                                )));
                              },
                              child: Image.asset("images/edit.png", height: 32.h, width: 32.h,)),
                          SizedBox(height: 16.h,),
                          Text("${agentProfileProvider.agentProfileModelData!.data!.name}", style: myStyleMontserrat(16.sp, Theme.of(context).highlightColor, FontWeight.w600),),
                          Text("${agentProfileProvider.agentProfileModelData!.data!.email}", style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
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
                  color: Theme.of(context).dividerColor,
                ),
                Text(AppLocalizations.of(context)!.balance.toString(), style: myStyleMontserrat(16.sp, Theme.of(context).highlightColor, FontWeight.w600),),
                Text("৳${agentProfileProvider.agentProfileModelData!.data!.walletBalance}", style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w500),),
                Divider(
                  endIndent: 0,
                  indent: 0,
                  thickness: 1.h,
                  color: Theme.of(context).dividerColor,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${AppLocalizations.of(context)!.role.toString()}: ${agentProfileProvider.agentProfileModelData!.role}", style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                      SizedBox(height: 8.h,),
                      Text("${AppLocalizations.of(context)!.contact_info.toString()}:", style: myStyleMontserrat(14.sp, Theme.of(context).highlightColor, FontWeight.w600),),
                      ListTile(
                        leading: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Image.asset("images/call.png")),
                        title: Text(AppLocalizations.of(context)!.mobile.toString(), style: myStyleMontserrat(14.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                        subtitle: Text("${agentProfileProvider.agentProfileModelData!.data!.phone}", style: myStyleMontserrat(14.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                      ),
                      ListTile(
                        leading: Padding(
                            padding: EdgeInsets.only(top: 12.h),
                            child: Image.asset("images/mail.png")),
                        title: Text(AppLocalizations.of(context)!.email.toString(), style: myStyleMontserrat(14.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                        subtitle: Text("${agentProfileProvider.agentProfileModelData!.data!.email}", style: myStyleMontserrat(14.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                      ),
                      ListTile(
                        leading: Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Image.asset("images/home.png")),
                        title: Text(AppLocalizations.of(context)!.address.toString(), style: myStyleMontserrat(14.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                        subtitle: Text("${agentProfileProvider.agentProfileModelData!.data!.areaName}, ${agentProfileProvider.agentProfileModelData!.data!.thanaName}, ${agentProfileProvider.agentProfileModelData!.data!.districtName}", style: myStyleMontserrat(14.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600), maxLines: 2,),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ):Center(child: SizedBox.shrink()),
        );
      }
    );
  }
}
