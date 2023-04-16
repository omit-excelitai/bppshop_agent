
import 'package:bppshop_agent/view/screens/bottom_nav_bar/add_customer_page.dart';
import 'package:bppshop_agent/view/screens/customer_list_page.dart';
import 'package:bppshop_agent/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/bottom_navigation_bar_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';

class CustomerPage extends StatefulWidget {
  static const String routeName = '/customer_page';
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, bottomNavigationBarProvider, child){
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
            title: Text("Customer", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
          ),
          body: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Row(children: [
                  Expanded(
                    flex: 2,
                    child: CustomHomePageContainer(
                      onTap: (){
                        Navigator.of(context).pushNamed(CustomerListPage.routeName);
                      },
                      title: "Customer List",
                      image: "images/customerlist.png",
                    ),
                  ),
                  SizedBox(width: 12.w,),
                  Expanded(
                    flex: 2,
                    child: CustomHomePageContainer(
                      onTap: (){
                        Navigator.of(context).pushNamed(AddCustomerPage.routeName);
                      },
                      title: "Add Customer",
                      image: "images/addcustomer.png",
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
