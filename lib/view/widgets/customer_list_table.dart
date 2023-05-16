
import 'package:bppshop_agent/provider/customer_list_provider.dart';
import 'package:bppshop_agent/view/screens/customer_profile_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../data/model/request_model/customer_list_request_model.dart';
import '../../localization/app_localization.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import 'navigation_service_without_context.dart';

class CustomerListTable extends StatefulWidget {
  CustomerListTable({Key? key}) : super(key: key);

  @override
  State<CustomerListTable> createState() => _CustomerListTableState();
}

class _CustomerListTableState extends State<CustomerListTable> {

  CustomerListTableDataSource? customerListTableDataSource;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _load(true, context);
    });
  }

  _load(bool reLoad, BuildContext context){
    Provider.of<CustomerListProvider>(context, listen: false).customerAllList(pageNo: 1, no_of_rows: 10, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerListProvider>(
      builder: (BuildContext context, customerListProvider, Widget? child) {
        if(customerListProvider.customerList != null && customerListProvider.customerList!.length > 0) {
          customerListTableDataSource = CustomerListTableDataSource(customerListData: customerListProvider.customerList!);
          return SfDataGrid(
            shrinkWrapRows: true,
            //isScrollbarAlwaysShown: true,
            verticalScrollPhysics: ScrollPhysics(),
            frozenColumnsCount: 1,
            footerFrozenColumnsCount: 1,
            //defaultColumnWidth: 100.w,
            source: customerListTableDataSource!,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  columnName: 'customerID',
                  width: 100.w,
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
                  columnName: 'customerName',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Customer Name',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'customerEmail',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Customer Email',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'mobileNumber',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Mobile Number',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'customerAddress',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.centerLeft,
                      child: Text('Customer Address',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  minimumWidth: 96.w,
                  columnName: 'action',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text('Action',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
            ],
          );
        }
        else{
          return Center(
            child: Text(AppLocalizations.of(context)!.no_data.toString(), style: myStyleMontserrat(18.sp, Theme.of(context).hintColor, FontWeight.w500),),
          );
        }
      },
    );
  }
}

class CustomerListTableDataSource extends DataGridSource {
  CustomerListTableDataSource({required List<CustomerListData> customerListData}) {
    _customerListData = customerListData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'customerID', value: e.id.toString()),
      DataGridCell<String>(columnName: 'customerName', value: e.customerName.toString()),
      DataGridCell<String>(columnName: 'customerEmail', value: e.customerEmail.toString()),
      DataGridCell<String>(columnName: 'mobileNumber', value: e.customerMobile.toString()),
      DataGridCell<String>(columnName: 'customerAddress', value: e.customerAddress.toString()),
      DataGridCell<String>(columnName: 'action', value: e.id.toString(),),
    ]))
        .toList();
  }

  List<DataGridRow> _customerListData = [];
  @override
  List<DataGridRow> get rows => _customerListData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    NavigationService routeService = NavigationService();
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) {
        return e.columnName == "action" ?Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){

                },
                child: Container(
                  alignment: Alignment.center,
                  height: 24.h,
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
                      color: AppColorResources.circleColor),
                  child: Text("Login",style: myStyleMontserrat(12.sp, AppColorResources.homeItemColor, FontWeight.w500),),
                ),
              ),
              GestureDetector(
                onTap: (){
                  routeService.routeTo(CustomerProfilePage.routeName, arguments: e.value);
                  if(kDebugMode){
                    print("Check Customer ID------------${e.value}");
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(left: 4.w),
                  alignment: Alignment.center,
                  height: 24.h,
                  width: 24.w,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r),
                      color: AppColorResources.primaryDeepBlue),
                  child: Icon(Icons.visibility_outlined, size: 16, color: AppColorResources.primaryWhite,),
                ),
              ),
            ],
          ),
        ):Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Text(e.value.toString(),
            style: myStyleMontserrat(12.sp, Theme.of(NavigationService.navigatorKey.currentContext!).secondaryHeaderColor, FontWeight.w500),
          ),
        );
      }).toList(),
    );
  }
}

