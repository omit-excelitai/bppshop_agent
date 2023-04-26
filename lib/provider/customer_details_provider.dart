
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/customer_details_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/response_model/customer_details_response_model.dart';

class CustomerDetailsProvider with ChangeNotifier{

  final DioClient dioClient;
  final CustomerDetailsRepo customerDetailsRepo;
  CustomerDetailsResponseModel? _customerDetailsResponseModel;
  bool _isLoading = false;
  int? id;

  CustomerDetailsProvider({required this.dioClient, required this.customerDetailsRepo});

  CustomerDetailsResponseModel? get customerDetailsResponseModel => _customerDetailsResponseModel;
  bool get isLoading => _isLoading;

  /// Fetch Customer Details Data
  Future<void> fetchCustomerDetailsData(BuildContext context, ) async {
    EasyLoading.show(status: 'loading...');
    _isLoading = true;
    notifyListeners();
      ApiResponse apiResponse = await customerDetailsRepo.getCustomerDetails(id: id);
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _customerDetailsResponseModel = CustomerDetailsResponseModel.fromJson(apiResponse.response!.data);

        _customerDetailsResponseModel = _customerDetailsResponseModel;

        if(kDebugMode){
          print("Check customer details-------------${_customerDetailsResponseModel!.data}");
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