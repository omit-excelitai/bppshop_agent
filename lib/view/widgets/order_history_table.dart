
import 'package:bppshop_agent/provider/order_history_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../data/model/request_model/order_history_request_model.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';

class OrderHistoryTable extends StatefulWidget {
  const OrderHistoryTable({Key? key}) : super(key: key);

  @override
  State<OrderHistoryTable> createState() => _OrderHistoryTableState();
}

class _OrderHistoryTableState extends State<OrderHistoryTable> {

  OrderHistoryTableDataSource? orderHistoryTableDataSource;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderHistoryProvider>(context, listen: false).fetchOrderHistoryData(pageNo: 1, no_of_rows: 5, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderHistoryProvider>(
      builder: (BuildContext context, orderHistoryProvider, Widget? child) {
        if(orderHistoryProvider.orderHistoryList != null && orderHistoryProvider.orderHistoryList!.length > 0){
          orderHistoryTableDataSource = OrderHistoryTableDataSource(orderHistoryData: orderHistoryProvider.orderHistoryList!);
          return SfDataGrid(
            shrinkWrapRows: true,
            isScrollbarAlwaysShown: true,
            frozenColumnsCount: 1,
            footerFrozenColumnsCount: 2,
            //defaultColumnWidth: 80.w,
            source: orderHistoryTableDataSource!,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                width: 80.w,
                  columnName: 'orderID',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Order ID',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'orderDate',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Order Date',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'customerID',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Customer ID',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'totalProducts',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Total Products',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'totalAmount',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Total Amount',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  width: 70.w,
                  columnName: 'action',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Action',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  width: 72.w,
                  columnName: 'billFolder',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerRight,
                      child: Text('Bill Folder',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
            ],
          );
        }
        else{
          return SizedBox.shrink();
        }

      },
    );
  }
}


class OrderHistoryTableDataSource extends DataGridSource {
  OrderHistoryTableDataSource({required List<OrderHistoryData> orderHistoryData}) {
    _orderHistoryData = orderHistoryData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'orderID', value: e.orderId.toString()),
      DataGridCell<String>(columnName: 'orderDate', value: e.orderDate.toString()),
      DataGridCell<String>(columnName: 'customerID', value: e.customerId.toString()),
      DataGridCell<String>(columnName: 'totalProducts', value: e.totalProducts.toString()),
      DataGridCell<String>(columnName: 'totalAmount', value: e.totalAmount.toString()),
      DataGridCell<String>(columnName: 'action', value: e.orderId.toString()),
      DataGridCell<String>(columnName: 'billFolder', value: e.orderId.toString()),
    ]))
        .toList();
  }

  List<DataGridRow> _orderHistoryData = [];
  @override
  List<DataGridRow> get rows => _orderHistoryData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return e.columnName == "action" ?Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 12.w),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  if(kDebugMode){
                    print("Check Order ID------------${e.value}");
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 24.h,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
                      color: AppColorResources.circleColor),
                  child: Text("Details",style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                ),
              ),
            ],
          ),
        ):e.columnName == "billFolder" ?Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.only(left: 4.w),
                  alignment: Alignment.center,
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
                      color: AppColorResources.primaryDeepBlue),
                  child: Icon(Icons.folder_open_outlined, size: 16, color: AppColorResources.primaryWhite,),
                ),
              ),
            ],
          ),
        ):Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(12),
          child: Text(e.value.toString(),
            style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w500),
          ),
        );
      }).toList(),
    );
  }
}

// import 'package:bppshop/const/color.dart';
// import 'package:bppshop/const/style.dart';
// import 'package:bppshop/model/order_history_model.dart';
// import 'package:bppshop/providers/order_history_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// class OrderHistoryTable extends StatefulWidget {
//   const OrderHistoryTable({Key? key}) : super(key: key);
//
//   @override
//   State<OrderHistoryTable> createState() => _OrderHistoryTableState();
// }
//
// class _OrderHistoryTableState extends State<OrderHistoryTable> {
//   List<OrderHistoryList> orderHistoryList = <OrderHistoryList>[];
//   late OrderHistoryTableDataSource orderHistoryTableDataSource;
//
//   @override
//   void initState() {
//     super.initState();
//     orderHistoryList = getOrderHistoryData();
//     orderHistoryTableDataSource = OrderHistoryTableDataSource(orderHistoryData: orderHistoryList);
//     Provider.of<OrderHistoryProvider>(context, listen: false).getOrderHistoryData();
//   }
//
//   List<OrderHistoryModel> orderHistoryData = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return SfDataGrid(
//       shrinkWrapRows: true,
//       isScrollbarAlwaysShown: true,
//       frozenColumnsCount: 1,
//       footerFrozenColumnsCount: 2,
//       defaultColumnWidth: 80.w,
//       source: orderHistoryTableDataSource,
//       columnWidthMode: ColumnWidthMode.fill,
//       columns: <GridColumn>[
//         GridColumn(
//             columnName: 'orderID',
//             label: Container(
//                 color: primaryDeepBlue,
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Order ID',
//                   style: myStyleMontserrat(12.sp, countColor, FontWeight.w600),
//                 ))),
//         GridColumn(
//             columnWidthMode: ColumnWidthMode.auto,
//             columnName: 'orderDate',
//             label: Container(
//                 color: primaryDeepBlue,
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.centerLeft,
//                 child: Text('Order Date',
//                   style: myStyleMontserrat(12.sp, countColor, FontWeight.w600),))),
//         GridColumn(
//             columnWidthMode: ColumnWidthMode.auto,
//             columnName: 'customerID',
//             label: Container(
//                 color: primaryDeepBlue,
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Customer ID',
//                   style: myStyleMontserrat(12.sp, countColor, FontWeight.w600),
//                 ))),
//         GridColumn(
//             columnWidthMode: ColumnWidthMode.auto,
//             columnName: 'totalProducts',
//             label: Container(
//                 color: primaryDeepBlue,
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.centerLeft,
//                 child: Text('Total Products',
//                   style: myStyleMontserrat(12.sp, countColor, FontWeight.w600),))),
//         GridColumn(
//             columnWidthMode: ColumnWidthMode.auto,
//             columnName: 'totalAmount',
//             label: Container(
//                 color: primaryDeepBlue,
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.centerLeft,
//                 child: Text('Total Amount',
//                   style: myStyleMontserrat(12.sp, countColor, FontWeight.w600),))),
//         GridColumn(
//             columnWidthMode: ColumnWidthMode.auto,
//             minimumWidth: 80.w,
//             columnName: 'action',
//             label: Container(
//                 color: primaryDeepBlue,
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.centerLeft,
//                 child: Text('Action',
//                   style: myStyleMontserrat(12.sp, countColor, FontWeight.w600),))),
//         GridColumn(
//             columnWidthMode: ColumnWidthMode.auto,
//             //minimumWidth: 96.w,
//             columnName: 'billFolder',
//             label: Container(
//                 color: primaryDeepBlue,
//                 padding: EdgeInsets.all(12),
//                 alignment: Alignment.centerRight,
//                 child: Text('Bill Folder',
//                   style: myStyleMontserrat(12.sp, countColor, FontWeight.w600),))),
//       ],
//     );
//   }
//
//   List<OrderHistoryList> getOrderHistoryData() {
//     return [
//       OrderHistoryList("#100470", "01 Feb 2023\n09:09 AM", "#100470", "120", "৳252668123626", "", ""),
//       OrderHistoryList("#100470", "01 Feb 2023\n09:09 AM", "#100470", "120", "৳252668123626", "", ""),
//       OrderHistoryList("#100470", "01 Feb 2023\n09:09 AM", "#100470", "120", "৳252668123626", "", ""),
//       OrderHistoryList("#100470", "01 Feb 2023\n09:09 AM", "#100470", "120", "৳252668123626", "", ""),
//       OrderHistoryList("#100470", "01 Feb 2023\n09:09 AM", "#100470", "120", "৳252668123626", "", ""),
//       OrderHistoryList("#100470", "01 Feb 2023\n09:09 AM", "#100470", "120", "৳252668123626", "", ""),
//     ];
//   }
// }
//
// class OrderHistoryList {
//   OrderHistoryList(this.orderID, this.orderDate, this.customerID, this.totalProducts, this.totalAmount, this.action, this.billFolder);
//
//   final String orderID;
//   final String orderDate;
//   final String customerID;
//   final String totalProducts;
//   final String totalAmount;
//   final String ?action;
//   final String ?billFolder;
// }
//
// class OrderHistoryTableDataSource extends DataGridSource {
//   OrderHistoryTableDataSource({required List<OrderHistoryList> orderHistoryData}) {
//     _orderHistoryData = orderHistoryData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//       DataGridCell<String>(columnName: 'orderID', value: e.orderID),
//       DataGridCell<String>(columnName: 'orderDate', value: e.orderDate),
//       DataGridCell<String>(columnName: 'customerID', value: e.customerID),
//       DataGridCell<String>(columnName: 'totalProducts', value: e.totalProducts),
//       DataGridCell<String>(columnName: 'totalAmount', value: e.totalAmount),
//       DataGridCell<String>(columnName: 'action', value: e.action),
//       DataGridCell<String>(columnName: 'billFolder', value: e.billFolder),
//     ]))
//         .toList();
//   }
//
//   List<DataGridRow> _orderHistoryData = [];
//   @override
//   List<DataGridRow> get rows => _orderHistoryData;
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//       cells: row.getCells().map<Widget>((e) {
//         return e.columnName == "action" ?Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.all(12),
//           child: Row(
//             children: [
//               GestureDetector(
//                 onTap: (){},
//                 child: Container(
//                   alignment: Alignment.center,
//                   height: 24.h,
//                   padding: EdgeInsets.symmetric(horizontal: 6.w),
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
//                       color: circleColor),
//                   child: Text("Details",style: myStyleMontserrat(12.sp, homeItemColor, FontWeight.w500),),
//                 ),
//               ),
//             ],
//           ),
//         ):e.columnName == "billFolder" ?Container(
//           alignment: Alignment.centerRight,
//           padding: EdgeInsets.all(12),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               GestureDetector(
//                 onTap: (){},
//                 child: Container(
//                   margin: EdgeInsets.only(left: 4.w),
//                   alignment: Alignment.center,
//                   height: 24.h,
//                   width: 24.w,
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
//                       color: primaryDeepBlue),
//                   child: Icon(Icons.folder_open_outlined, size: 16, color: primaryWhite,),
//                 ),
//               ),
//             ],
//           ),
//         ):Container(
//           alignment: Alignment.centerLeft,
//           padding: EdgeInsets.symmetric(horizontal: 12.w),
//           child: Text(e.value.toString(),
//             style: myStyleMontserrat(12.sp, homeItemColor, FontWeight.w500),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

