
import 'package:bppshop_agent/view/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../localization/app_localization.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';

logoutAlert(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).dialogBackgroundColor,
          alignment: Alignment.center,
          content: Container(
            width: double.maxFinite,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w),
                    child: Text(
                      AppLocalizations.of(context)!.logout.toString(),
                      style: myStyleMontserrat(14.sp,
                          AppColorResources.primaryOrange, FontWeight.w500),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).dividerColor,
                  ),
                  SizedBox(height: 10.h,),
                  Text(AppLocalizations.of(context)!.log_out_text.toString(), style: myStyleMontserrat(12.sp, Theme.of(context).secondaryHeaderColor),
                    textAlign: TextAlign.center,),
                  SizedBox(height: 15.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.center,
                          height: 30.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColorResources.primaryOrange.withOpacity(0.3)),
                              borderRadius: BorderRadius.all(Radius.circular(5.r))
                          ),
                          child: Text(AppLocalizations.of(context)!.no_thanks.toString(), style: myStyleMontserrat(12.sp, Theme.of(context).hintColor),),
                        ),
                      ),
                      InkWell(
                        onTap: () async{
                          SharedPreferences _token = await SharedPreferences.getInstance();
                          await _token.clear();
                          Navigator.of(context).pushNamedAndRemoveUntil(SignInPage.routeName, (route) => false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 28.w),
                          alignment: Alignment.center,
                          height: 30.h,
                          decoration: BoxDecoration(
                              color: AppColorResources.primaryOrange,
                              borderRadius: BorderRadius.all(Radius.circular(5.r))
                          ),
                          child: Text(AppLocalizations.of(context)!.logout.toString(), style: myStyleMontserrat(12.sp, AppColorResources.primaryWhite),),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        );
      });
}