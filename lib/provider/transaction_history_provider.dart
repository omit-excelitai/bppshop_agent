
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/transaction_history_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/request_model/transaction_history_request_model.dart';

class TransactionHistoryProvider with ChangeNotifier{

  final DioClient dioClient;
  final TransactionHistoryRepo transactionHistoryRepo;
  bool _isLoading = false;
  List<dynamic>? _transactionHistoryList;
  TransactionHistoryRequestModel? _transactionHistoryRequestModel;

  TransactionHistoryProvider({required this.dioClient, required this.transactionHistoryRepo});

  bool get isLoading => _isLoading;
  List<dynamic>? get transactionHistoryList => _transactionHistoryList;
  TransactionHistoryRequestModel? get transactionHistoryRequestModel => _transactionHistoryRequestModel;

  /// Fetch Transaction History Data
  Future<String?> fetchTransactionHistoryData({required dynamic pageNo, required dynamic no_of_rows, required BuildContext context}) async{

    _isLoading=true;
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await transactionHistoryRepo.getTransactionHistoryData(pageNo: pageNo, no_of_rows: no_of_rows);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _isLoading=false;

      _transactionHistoryRequestModel = TransactionHistoryRequestModel.fromJson(apiResponse.response!.data);
      _transactionHistoryList = _transactionHistoryRequestModel!.data!.transactionHistoryList;

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