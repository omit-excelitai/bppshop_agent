import 'package:bppshop_agent/provider/bottom_navigation_bar_provider.dart';
import 'package:bppshop_agent/provider/order_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import '../widgets/no_internet_connection_widget.dart';
import '../widgets/products_table.dart';
import 'drawer/my_drawer.dart';

class OrderDetailsPage extends StatefulWidget {
  static const String routeName = '/order_details_page';
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      dynamic orderId = ModalRoute.of(context)!.settings.arguments as String;
      Provider.of<OrderDetailsProvider>(context, listen: false).fetchOrderDetails(context, id: orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<BottomNavigationBarProvider, OrderDetailsProvider>(
        builder: (BuildContext context, bottomNavigationBarProvider, orderDetailsProvider, Widget? child) {
          return Scaffold(
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
              title: Text("Order Details", style: myStyleMontserrat(18.sp, AppColorResources.secondaryWhite, FontWeight.w400),),
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
            ):SingleChildScrollView(
              child: Column(
                children: [
                  orderDetailsProvider.orderDetailsResponseModel!=null?Container(
                    margin: EdgeInsets.only(top: 12.h),
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    color: Theme.of(context).cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Customer Name: ${orderDetailsProvider.orderDetailsResponseModel!.data!.customerName}", style: myStyleMontserrat(18.sp, Theme.of(context).highlightColor, FontWeight.w600),),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Order Id: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.orderId}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Order Date: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.orderDate}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Order Amount: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.orderAmount}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Discount Amount: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.discountAmount}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Order Status: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.orderStatus}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Payment Method: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.paymentMethod}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Payment Status: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.paymentStatus}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        Row(
                          children: [
                            Text("Shipping Address: ", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w600),),
                            Text("${orderDetailsProvider.orderDetailsResponseModel!.data!.shippingAddress}", style: myStyleMontserrat(15.sp, Theme.of(context).secondaryHeaderColor, FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: 12.h,),
                        ProductsTablePage(),
                      ],
                    ),
                  ):SizedBox.shrink(),
                ],
              ),
            ),
            bottomNavigationBar: bottomNavigationBarProvider.bottomNavigationBar(context, false),
          );
        }
      );
  }
}
