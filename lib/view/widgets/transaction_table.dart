
import 'package:bppshop_agent/provider/transaction_history_provider.dart';
import 'package:bppshop_agent/utill/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../localization/app_localization.dart';
import '../../utill/app_color_resources.dart';
import 'navigation_service_without_context.dart';

class ReusableTransactionTablePage extends StatefulWidget {
  ReusableTransactionTablePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReusableTransactionTablePage> {

  TransactionTableDataSource? transactionTableDataSource;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TransactionHistoryProvider>(context, listen: false).fetchTransactionHistoryData(pageNo: 1, no_of_rows: 5, context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionHistoryProvider>(
      builder: (BuildContext context, transactionHistoryProvider, Widget? child) {
        if(transactionHistoryProvider.transactionHistoryList != null && transactionHistoryProvider.transactionHistoryList!.length > 0){
          transactionTableDataSource = TransactionTableDataSource(transactionData: transactionHistoryProvider.transactionHistoryList!);
          return SfDataGrid(
            shrinkWrapRows: true,
            //isScrollbarAlwaysShown: true,
            verticalScrollPhysics: ScrollPhysics(),
            frozenColumnsCount: 1,
            //defaultColumnWidth: 88.w,
            source: transactionTableDataSource!,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'agendID',
                  width: 88.w,
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Agend ID',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'dateTime',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Date Time',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'transactionID',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Transaction ID',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'transactionType',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Transaction Type',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'orderGroupID',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Order Group ID',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'credit',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Credit',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'debit',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Debit',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'referenceNo',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Reference No.',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'balance',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Balance',
                        style: myStyleMontserrat(12.sp, AppColorResources.countColor, FontWeight.w600),))),
            ],
          );
        }else{
          return Center(
            child: Text(AppLocalizations.of(context)!.no_data.toString(), style: myStyleMontserrat(18.sp, Theme.of(context).hintColor, FontWeight.w500),),
          );
        }

      },
    );
  }
}

// class Transaction {
//   Transaction(this.agendID, this.dateTime, this.transactionID, this.transactionType, this.orderGroupID, this.credit, this.debit, this.referenceNo, this.balance);
//
//   final String agendID;
//   final String dateTime;
//   final String transactionID;
//   final String transactionType;
//   final String orderGroupID;
//   final String credit;
//   final String debit;
//   final String referenceNo;
//   final String balance;
// }

class TransactionTableDataSource extends DataGridSource {
  TransactionTableDataSource({required List<dynamic> transactionData}) {
    _transactionData = transactionData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'agendID', value: e.agendID),
      DataGridCell<String>(columnName: 'dateTime', value: e.dateTime),
      DataGridCell<String>(columnName: 'transactionID', value: e.transactionID),
      DataGridCell<String>(columnName: 'transactionType', value: e.transactionType),
      DataGridCell<String>(columnName: 'orderGroupID', value: e.orderGroupID),
      DataGridCell<String>(columnName: 'credit', value: e.credit),
      DataGridCell<String>(columnName: 'debit', value: e.debit),
      DataGridCell<String>(columnName: 'referenceNo', value: e.referenceNo),
      DataGridCell<String>(columnName: 'balance', value: e.balance)
    ]))
        .toList();
  }

  List<DataGridRow> _transactionData = [];
  @override
  List<DataGridRow> get rows => _transactionData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    NavigationService routeService = NavigationService();
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(e.value.toString(),
              style: myStyleMontserrat(12.sp, Theme.of(NavigationService.navigatorKey.currentContext!).secondaryHeaderColor, FontWeight.w500),
            ),
          );
        }).toList());
  }
}