
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/order_history_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/request_model/order_history_request_model.dart';

class OrderHistoryProvider with ChangeNotifier{

  final DioClient dioClient;
  final OrderHistoryRepo orderHistoryRepo;
  bool _isLoading = false;
  OrderHistoryRequestModel? _orderHistoryRequestModel;
  List<OrderHistoryData>? _orderHistoryList;
  OrderHistoryData? _orderHistoryData;

  OrderHistoryProvider({ required this.dioClient, required this.orderHistoryRepo});

  bool get isLoading => _isLoading;
  OrderHistoryRequestModel? get orderHistoryRequestModel => _orderHistoryRequestModel;
  List<OrderHistoryData>? get orderHistoryList => _orderHistoryList;
  OrderHistoryData? get orderHistoryData => _orderHistoryData;

  /// Fetch Order History Data
  Future<String?> fetchOrderHistoryData({required dynamic pageNo, required dynamic no_of_rows, required BuildContext context}) async{

    _isLoading=true;
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await orderHistoryRepo.orderHistoryData(pageNo: pageNo, no_of_rows: no_of_rows);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _isLoading=false;

      _orderHistoryRequestModel = OrderHistoryRequestModel.fromJson(apiResponse.response!.data);
      _orderHistoryList = _orderHistoryRequestModel!.data!.orderHistoryList;

      notifyListeners();
      EasyLoading.dismiss();
    }
    else {
      _isLoading=false;
      EasyLoading.dismiss();
      notifyListeners();
    }
    return null;
  }
}