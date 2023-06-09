
import 'package:bppshop_agent/view/screens/commission_history_page.dart';
import 'package:bppshop_agent/view/screens/pending_commission_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';

import '../../localization/app_localization.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/custom_button.dart';
import '../widgets/no_internet_connection_widget.dart';

class MyCommissionPage extends StatefulWidget {
  static const String routeName = '/my_commission_page';
  const MyCommissionPage({Key? key}) : super(key: key);

  @override
  State<MyCommissionPage> createState() => _MyCommissionPageState();
}

class _MyCommissionPageState extends State<MyCommissionPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (BuildContext context, bottomNavigationBarProvider, Widget? child) {
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
            title: Text(AppLocalizations.of(context)!.my_commission.toString(), style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    flex: 2,
                    child: CustomHomePageContainer(
                      onTap: (){
                        Navigator.of(context).pushNamed(PendingCommissionPage.routeName);
                      },
                      title: AppLocalizations.of(context)!.pending_commission.toString(),
                      image: "images/customerlist.png",
                    ),
                  ),
                  SizedBox(width: 12.w,),
                  Expanded(
                    flex: 2,
                    child: CustomHomePageContainer(
                      onTap: (){
                        Navigator.of(context).pushNamed(CommissionHistoryPage.routeName);
                      },
                      title: AppLocalizations.of(context)!.commission_history.toString(),
                      image: "images/commissionhistory.png",
                    ),),
                ],),
              ],
            ),
          ),
          bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context,false),
        );
      },
    );
  }
}
