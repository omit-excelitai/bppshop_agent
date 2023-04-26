import 'package:bppshop_agent/provider/pending_commission_provider.dart';
import 'package:bppshop_agent/utill/app_color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../data/model/request_model/pending_commission_request_model.dart';
import '../../utill/app_style.dart';

class ReusableCustomerTablePage extends StatefulWidget {
  /// Creates the home page.
  ReusableCustomerTablePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReusableCustomerTablePage> {

  PendingCommissionDataSource? pendingCommissionDataSource;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<PendingCommissionProvider>(context, listen: false).pendingCommission(pageNo: 1, no_of_rows: 5, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PendingCommissionProvider>(

      builder: (BuildContext context, pendingCommissionProvider, Widget? child) {
        if(pendingCommissionProvider.pendingCommissionList!=null && pendingCommissionProvider.pendingCommissionList!.length>0) {
          pendingCommissionDataSource = PendingCommissionDataSource(
              pendingCommissionData: pendingCommissionProvider
                  .pendingCommissionList!);
          // for(var element in pendingCommissionProvider.pendingCommissionList!){
          //   employees.add(PendingCommissionDataModel(element.customerId.toString(), element.orderId.toString(), element.totalProducts.toString(), element.totalAmount.toString(), element.totalCommission.toString()));
          // }

          return SfDataGrid(
            shrinkWrapRows: true,
            isScrollbarAlwaysShown: true,
            frozenColumnsCount: 1,
            defaultColumnWidth: 102.w,
            source: pendingCommissionDataSource!,
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
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'orderID',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Order ID',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'totalProducts',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Total Products',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'totalAmount',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Total Amount',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'totalCommission',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Total Commission',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
            ],
          );
        }else{
          return SizedBox.shrink();
        }
      },
    );
  }
}

class PendingCommissionDataSource extends DataGridSource {
  PendingCommissionDataSource({required List<PendingCommissionData> pendingCommissionData}) {
    _pendingCommissionData = pendingCommissionData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'customerID', value: e.customerId.toString()),
      DataGridCell<String>(columnName: 'orderID', value: e.orderId.toString()),
      DataGridCell<String>(columnName: 'totalProducts', value: e.totalProducts.toString()),
      DataGridCell<String>(columnName: 'totalAmount', value: e.totalAmount.toString()),
      DataGridCell<String>(columnName: 'totalCommission', value: e.totalCommission.toString())
    ]))
        .toList();
  }

  List<DataGridRow> _pendingCommissionData = [];
  @override
  List<DataGridRow> get rows => _pendingCommissionData;

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