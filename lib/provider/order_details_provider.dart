import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/order_details_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/response_model/order_details_response_model.dart';

class OrderDetailsProvider with ChangeNotifier{

  final DioClient dioClient;
  final OrderDetailsRepo orderDetailsRepo;
  bool _isLoading = false;
  OrderDetailsResponseModel? _orderDetailsResponseModel;
  List<Product>? _productsList;
  Product? _product;

  OrderDetailsProvider({required this.dioClient, required this.orderDetailsRepo});

  bool get isLoading => _isLoading;
  OrderDetailsResponseModel? get orderDetailsResponseModel => _orderDetailsResponseModel;
  List<Product>? get productsList => _productsList;
  Product? get product => _product;

  /// Fetch Order Details
  Future<void> fetchOrderDetails(BuildContext context, {required dynamic id}) async {

    EasyLoading.show(status: 'loading...');
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await orderDetailsRepo.getOrderDetailsData(id: id);
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      _orderDetailsResponseModel = OrderDetailsResponseModel.fromJson(apiResponse.response!.data);
      _orderDetailsResponseModel = _orderDetailsResponseModel;
      _productsList = _orderDetailsResponseModel!.data!.productsList;

      if(kDebugMode){
        print("Check ordered products-------------${_productsList}");
      }
      _isLoading = false;
      EasyLoading.dismiss();
      notifyListeners();

    } else {
      _isLoading = false;
      EasyLoading.dismiss();
      notifyListeners();
    }
  }
}