import 'package:bppshop_agent/utill/app_color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../localization/app_localization.dart';
import '../../utill/app_style.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  dynamic onPressed;
  NoInternetConnectionWidget({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
                height: 120.h,
                width: 120.w,
                "images/no_internet.json",
                fit: BoxFit.cover),
            SizedBox(
              height: 45.h,
            ),
            Text(AppLocalizations.of(context)!.no_internet.toString(), style: myStyleMontserrat(15.sp, AppColorResources.redColor, FontWeight.w600)),
            SizedBox(
              height: 5.h,
            ),
            Text(AppLocalizations.of(context)!.check_internet.toString(), style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w500)),
            SizedBox(
              height: 15.h,
            ),
            MaterialButton(
              color: AppColorResources.primaryOrange,
              onPressed: onPressed,
              minWidth: 150.w,
              child: Text(
                AppLocalizations.of(context)!.try_again.toString(),
                style: myStyleMontserrat(16.sp, AppColorResources.primaryWhite, FontWeight.w600),
              ),
            )
          ],
        ),
      ],
    )));
  }
}
