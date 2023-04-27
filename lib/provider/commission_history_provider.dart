
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/repositories/commission_history_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/request_model/commission_history_request_model.dart';

class CommissionHistoryProvider with ChangeNotifier{

  final DioClient dioClient;
  final CommissionHistoryRepo commissionHistoryRepo;
  CommissionHistoryRequestModel? _commissionHistoryRequestModel;
  List<dynamic>? _commissionHistoryList;
  bool _isLoading = false;

  CommissionHistoryProvider({required this.dioClient, required this.commissionHistoryRepo});

  CommissionHistoryRequestModel? get commissionHistoryRequestModel => _commissionHistoryRequestModel;
  List<dynamic>? get commissionHistoryList => _commissionHistoryList;
  bool get isLoading => _isLoading;

  /// Fetch Commission History Data
  Future<String?> fetchCommissionHistoryData({required dynamic pageNo, required dynamic no_of_rows, required BuildContext context}) async{

    _isLoading=true;
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await commissionHistoryRepo.commissionHistory(pageNo: pageNo, no_of_rows: no_of_rows);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _isLoading=false;

      _commissionHistoryRequestModel = CommissionHistoryRequestModel.fromJson(apiResponse.response!.data);
      _commissionHistoryList = _commissionHistoryRequestModel!.data!.commissionHistoryList;

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