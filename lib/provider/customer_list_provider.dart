
import 'package:bppshop_agent/data/repositories/customer_list_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/request_model/customer_list_request_model.dart';

class CustomerListProvider with ChangeNotifier{

  final DioClient dioClient;
  final CustomerListRepo customerListRepo;
  bool _isLoading = false;
  CustomerListRequestModel? _customerListRequestModel;
  List<CustomerListData>? _customerList;
  CustomerListData? _customerListData;

  CustomerListProvider({required this.dioClient, required this.customerListRepo});

  bool get isLoading => _isLoading;
  CustomerListRequestModel? get customerListRequestModel => _customerListRequestModel;
  List<CustomerListData>? get customerList => _customerList;
  CustomerListData? get customerListData => _customerListData;

  /// Fetch Customer List Data
  Future<String?> customerAllList({required dynamic pageNo, required dynamic no_of_rows, required BuildContext context}) async{

    _isLoading=true;
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await customerListRepo.fetchCustomerListData(pageNo: pageNo, no_of_rows: no_of_rows);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _isLoading=false;

      _customerListRequestModel = CustomerListRequestModel.fromJson(apiResponse.response!.data);
      _customerList = _customerListRequestModel!.data!.customerList;

      notifyListeners();
      EasyLoading.dismiss();
    } else {

      _isLoading=false;
      EasyLoading.dismiss();
      notifyListeners();

    }
    return null;
  }

}