import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../data/model/response_model/order_details_response_model.dart';
import '../../provider/order_details_provider.dart';
import '../../utill/app_color_resources.dart';
import '../../utill/app_style.dart';
import 'navigation_service_without_context.dart';

class ProductsTablePage extends StatefulWidget {
  /// Creates the home page.
  ProductsTablePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ProductsTablePage> {

  ProductDataSource? productsDataSource;

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
    return Consumer<OrderDetailsProvider>(
      builder: (BuildContext context, orderDetailsProvider, Widget? child) {
        if(orderDetailsProvider.productsList!=null && orderDetailsProvider.productsList!.length>0) {
          productsDataSource = ProductDataSource(productsList: orderDetailsProvider.productsList!);
          return SfDataGrid(
            shrinkWrapRows: true,
            //isScrollbarAlwaysShown: true,
            verticalScrollPhysics: ScrollPhysics(),
            //frozenColumnsCount: 1,
            //defaultColumnWidth: 102.w,
            source: productsDataSource!,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'productName',
                  width: 150.w,
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text(
                        'Product Name',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'quantity',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text('Quantity',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'price',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text(
                        'Price',
                        style: myStyleMontserrat(
                            12.sp, AppColorResources.countColor,
                            FontWeight.w600),
                      ))),
              GridColumn(
                  columnWidthMode: ColumnWidthMode.auto,
                  columnName: 'discount',
                  label: Container(
                      color: AppColorResources.primaryDeepBlue,
                      padding: EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text('Discount',
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

class ProductDataSource extends DataGridSource {
  ProductDataSource({required List<Product> productsList}) {
    _productsListData = productsList
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'productName', value: e.productName.toString()),
      DataGridCell<String>(columnName: 'quantity', value: e.quantity.toString()),
      DataGridCell<String>(columnName: 'price', value: e.price.toString()),
      DataGridCell<String>(columnName: 'discount', value: e.discount.toString())
    ]))
        .toList();
  }

  List<DataGridRow> _productsListData = [];
  @override
  List<DataGridRow> get rows => _productsListData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    NavigationService routeService = NavigationService();
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(e.value.toString(),
              style: myStyleMontserrat(12.sp, Theme.of(NavigationService.navigatorKey.currentContext!).secondaryHeaderColor, FontWeight.w500),
            ),
          );
        }).toList());
  }
}