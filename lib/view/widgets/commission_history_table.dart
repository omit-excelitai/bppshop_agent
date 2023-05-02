import 'package:bppshop_agent/provider/commission_history_provider.dart';
import 'package:bppshop_agent/utill/app_color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../data/model/request_model/commission_history_request_model.dart';
import '../../utill/app_style.dart';

class CommissionHistoryTable extends StatefulWidget {
  const CommissionHistoryTable({Key? key}) : super(key: key);

  @override
  State<CommissionHistoryTable> createState() => _CommissionHistoryTableState();
}

class _CommissionHistoryTableState extends State<CommissionHistoryTable> {

  CommissionHistoryDataSource? commissionHistoryDataSource;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CommissionHistoryProvider>(context, listen: false).fetchCommissionHistoryData(pageNo: 1, no_of_rows: 5, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommissionHistoryProvider>(
      builder: (BuildContext context, commissionHistoryProvider, Widget? child) {
        if(commissionHistoryProvider.commissionHistoryList != null && commissionHistoryProvider.commissionHistoryList!.length > 0){
          commissionHistoryDataSource = CommissionHistoryDataSource(commissionHistoryData: commissionHistoryProvider.commissionHistoryList!);
          return SfDataGrid(
            shrinkWrapRows: true,
            //isScrollbarAlwaysShown: true,
            verticalScrollPhysics: ScrollPhysics(),
            frozenColumnsCount: 1,
            //defaultColumnWidth: 102.w,
            source: commissionHistoryDataSource!,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'customerID',
                  width: 102.w,
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
        }else{
          return Center(
            child: Text("No Data Found!", style: myStyleMontserrat(18.sp, AppColorResources.secondaryBlack, FontWeight.w500),),
          );
        }
      },
    );
  }
}

class CommissionHistoryDataSource extends DataGridSource {
  CommissionHistoryDataSource({required List<CommissionHistoryListData> commissionHistoryData}) {
    _commissionHistoryData = commissionHistoryData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'customerID', value: e.customerId.toString()),
      DataGridCell<String>(columnName: 'orderID', value: e.orderId.toString()),
      DataGridCell<String>(columnName: 'totalProducts', value: e.totalProducts.toString()),
      DataGridCell<String>(columnName: 'totalAmount', value: e.totalAmount.toString()),
      DataGridCell<String>(columnName: 'totalCommission', value: e.totalCommission.toString())
    ]))
        .toList();
  }

  List<DataGridRow> _commissionHistoryData = [];
  @override
  List<DataGridRow> get rows => _commissionHistoryData;

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
