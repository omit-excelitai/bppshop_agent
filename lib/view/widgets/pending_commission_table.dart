// import 'package:bppshop_agent/utill/app_color_resources.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
//
// import '../../utill/app_style.dart';
//
// class ReusableCustomerTablePage extends StatefulWidget {
//   /// Creates the home page.
//   ReusableCustomerTablePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<ReusableCustomerTablePage> {
//   List<Employee> employees = <Employee>[];
//   late EmployeeDataSource employeeDataSource;
//
//   @override
//   void initState() {
//     super.initState();
//     employees = getEmployeeData();
//     employeeDataSource = EmployeeDataSource(employeeData: employees);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SfDataGrid(
//         shrinkWrapRows: true,
//         isScrollbarAlwaysShown: true,
//         frozenColumnsCount: 1,
//         defaultColumnWidth: 102.w,
//         source: employeeDataSource,
//         columnWidthMode: ColumnWidthMode.fill,
//         columns: <GridColumn>[
//           GridColumn(
//               columnName: 'customerID',
//               label: Container(
//                   color: AppColorResources.primaryDeepBlue,
//                   padding: EdgeInsets.all(12),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Customer ID',
//                     style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),
//                   ))),
//           GridColumn(
//             columnWidthMode: ColumnWidthMode.auto,
//               columnName: 'orderID',
//               label: Container(
//                   color: AppColorResources.primaryDeepBlue,
//                   padding: EdgeInsets.all(12),
//                   alignment: Alignment.centerLeft,
//                   child: Text('Order ID',
//                     style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
//           GridColumn(
//               columnWidthMode: ColumnWidthMode.auto,
//               columnName: 'totalProducts',
//               label: Container(
//                   color: AppColorResources.primaryDeepBlue,
//                   padding: EdgeInsets.all(12),
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Total Products',
//                     style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),
//                   ))),
//           GridColumn(
//               columnWidthMode: ColumnWidthMode.auto,
//               columnName: 'totalAmount',
//               label: Container(
//                   color: AppColorResources.primaryDeepBlue,
//                   padding: EdgeInsets.all(12),
//                   alignment: Alignment.centerLeft,
//                   child: Text('Total Amount',
//                     style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
//           GridColumn(
//               columnWidthMode: ColumnWidthMode.auto,
//               columnName: 'totalCommission',
//               label: Container(
//                   color: AppColorResources.primaryDeepBlue,
//                   padding: EdgeInsets.all(12),
//                   alignment: Alignment.centerLeft,
//                   child: Text('Total Commission',
//                     style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
//         ],
//       );
//   }
//
//   List<Employee> getEmployeeData() {
//     return [
//       Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
//       Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
//       Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
//       Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
//       Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
//       Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626")
//     ];
//   }
// }
//
// class Employee {
//   Employee(this.customerID, this.orderID, this.totalProducts, this.totalAmount, this.totalCommission);
//
//   final String customerID;
//   final String orderID;
//   final String totalProducts;
//   final String totalAmount;
//   final String totalCommission;
// }
//
// class EmployeeDataSource extends DataGridSource {
//   EmployeeDataSource({required List<Employee> employeeData}) {
//     _employeeData = employeeData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//       DataGridCell<String>(columnName: 'customerID', value: e.customerID),
//       DataGridCell<String>(columnName: 'orderID', value: e.orderID),
//       DataGridCell<String>(columnName: 'totalProducts', value: e.totalProducts),
//       DataGridCell<String>(columnName: 'totalAmount', value: e.totalAmount),
//       DataGridCell<String>(columnName: 'totalCommission', value: e.totalCommission)
//     ]))
//         .toList();
//   }
//
//   List<DataGridRow> _employeeData = [];
//   @override
//   List<DataGridRow> get rows => _employeeData;
//
//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//           return Container(
//             alignment: Alignment.centerLeft,
//             padding: EdgeInsets.symmetric(horizontal: 12.w),
//             child: Text(e.value.toString(),
//               style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w500),
//             ),
//           );
//         }).toList());
//   }
// }

/// Testing

import 'package:bppshop_agent/provider/pending_commission_provider.dart';
import 'package:bppshop_agent/utill/app_color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../utill/app_style.dart';

class ReusableCustomerTablePage extends StatefulWidget {
  /// Creates the home page.
  ReusableCustomerTablePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReusableCustomerTablePage> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    Provider.of<PendingCommissionProvider>(context, listen: false).pendingCommissionList;
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PendingCommissionProvider>(
      builder: (BuildContext context, pendingCommissionProvider, Widget? child) {
        return SfDataGrid(
          shrinkWrapRows: true,
          isScrollbarAlwaysShown: true,
          frozenColumnsCount: 1,
          defaultColumnWidth: 102.w,
          source: employeeDataSource,
          columnWidthMode: ColumnWidthMode.fill,
          columns: <GridColumn>[
            GridColumn(
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
                columnName: 'orderID',
                label: Container(
                    color: AppColorResources.primaryDeepBlue,
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text('Order ID',
                      style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
            GridColumn(
                columnWidthMode: ColumnWidthMode.auto,
                columnName: 'totalProducts',
                label: Container(
                    color: AppColorResources.primaryDeepBlue,
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Total Products',
                      style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),
                    ))),
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
                columnName: 'totalCommission',
                label: Container(
                    color: AppColorResources.primaryDeepBlue,
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.centerLeft,
                    child: Text('Total Commission',
                      style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
          ],
        );
      },
    );
  }

  List<Employee> getEmployeeData() {

    return [
      Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
      Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
      Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
      Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
      Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626"),
      Employee("#100470", "#100470", "2568848150", "৳252668123626", "৳252668123626")
    ];
  }
}

class Employee {
  Employee(this.customerID, this.orderID, this.totalProducts, this.totalAmount, this.totalCommission);

  final String customerID;
  final String orderID;
  final String totalProducts;
  final String totalAmount;
  final String totalCommission;
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'customerID', value: e.customerID),
      DataGridCell<String>(columnName: 'orderID', value: e.orderID),
      DataGridCell<String>(columnName: 'totalProducts', value: e.totalProducts),
      DataGridCell<String>(columnName: 'totalAmount', value: e.totalAmount),
      DataGridCell<String>(columnName: 'totalCommission', value: e.totalCommission)
    ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];
  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(e.value.toString(),
              style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w500),
            ),
          );
        }).toList());
  }
}