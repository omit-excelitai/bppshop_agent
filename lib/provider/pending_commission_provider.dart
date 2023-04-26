
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/model/request_model/pending_commission_request_model.dart';
import 'package:bppshop_agent/data/repositories/pending_commission_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/api_response.dart';


class PendingCommissionProvider with ChangeNotifier{

  final DioClient dioClient;
  bool _isLoading = false;
  final PendingCommissionRepo pendingCommissionRepo;
  PendingCommissionRequestModel? _pendingCommissionRequestModel;
  List<PendingCommissionData>? _pendingCommissionList;
  PendingCommissionData? _pendingCommissionData;

  PendingCommissionProvider({required this.dioClient, required this.pendingCommissionRepo});

  bool get isLoading => _isLoading;
  PendingCommissionRequestModel? get pendingCommissionRequestModel => _pendingCommissionRequestModel;
  List<PendingCommissionData>? get pendingCommissionList => _pendingCommissionList;
  PendingCommissionData? get pendingCommissionData => _pendingCommissionData;

  /// Fetch pending commission
  Future<String?> pendingCommission({required dynamic pageNo, required dynamic no_of_rows, required BuildContext context}) async{

    _isLoading=true;
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await pendingCommissionRepo.pendingCommissionHistory(pageNo: pageNo, no_of_rows: 5);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _isLoading=false;

      _pendingCommissionRequestModel = PendingCommissionRequestModel.fromJson(apiResponse.response!.data);
      _pendingCommissionList = _pendingCommissionRequestModel!.data!.pendingCommissionList;

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