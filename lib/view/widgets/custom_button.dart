import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';

customButton(
VoidCallback ?onTap,
    String title
    ){
  return InkWell(
    onTap: onTap,
    child: Container(
      alignment: Alignment.center,
      height: 38.h,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
      color: AppColorResources.primaryBlue,),
      child: Text("$title", style: myStyleMontserrat(14.sp, AppColorResources.secondaryWhite, FontWeight.w600),),
    ),
  );
}

// customHomePageItem(
//     VoidCallback? onTap,
//     String? title,
//     Image ? image,
//     ){
//   return InkWell(
//     onTap: onTap,
//     child: Container(
//       margin: EdgeInsets.only(right: 6),
//       height: 115,
//       decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: primaryWhite,
//         border: Border.all(color: borderColor, width: 1.4),
//         boxShadow: [
//           BoxShadow(
//             color: shadowColor,
//             offset: Offset(
//               3.0,
//               3.0,
//             ),
//             blurRadius: 3.0,
//           ), ],
//       ),
//       child: Column(
//         children: [
//           Image.asset("$image"),
//           Text("$title", style: myStyleMontserrat(12, homeItemColor, FontWeight.w700),),
//         ],
//       ),
//     ),
//   );
// }

class CustomHomePageContainer extends StatelessWidget {
  const CustomHomePageContainer({
    super.key, required this.title, required this.image, required this.onTap,
  });
  final String title;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 115.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).primaryColor, width: 1.4.w),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor,
              offset: Offset(
                3.0,
                3.0,
              ),
              blurRadius: 3.0,
            ), ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("$image", height: 50.h, width: 50.w,),
            SizedBox(height: 10.h,),
            Text("$title", style: myStyleMontserrat(12.sp, Theme.of(context).highlightColor, FontWeight.w700),),
          ],
        ),
      ),
    );
  }
}

class AddandUpdateButton extends StatelessWidget {
  const AddandUpdateButton({
    super.key, required this.onTap, required this.title,
  });
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 146.w,
        height: 35.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: AppColorResources.primaryDeepBlue),
        child: Text("$title", style: myStyleMontserrat(12.sp, AppColorResources.primaryWhite, FontWeight.w600),),
      ),
    );
  }
}

class DashboardCustomContainer extends StatelessWidget {
  const DashboardCustomContainer({
    super.key, required this.onTap, required this.title, required this.amount, required this.image, required this.color,
  });
  final VoidCallback onTap;
  final String title;
  final String amount;
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
        height: 80.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r),
          color: color,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset("$image"),
                SizedBox(width: 8.w,),
                Text("$title", style: myStyleMontserrat(13, AppColorResources.secondaryWhite, FontWeight.w500),),
              ],
            ),
            Text("$amount", style: myStyleMontserrat(20, AppColorResources.secondaryWhite, FontWeight.w500),),
          ],
        ),
      ),
    );
  }
}

