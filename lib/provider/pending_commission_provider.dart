

import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/model/request_model/pending_commission_request_model.dart';
import 'package:bppshop_agent/data/repositories/pending_commission_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../data/model/base_model/api_response.dart';
import '../data/model/base_model/error_response.dart';
import '../helper/api_checker.dart';
import '../utill/app_color_resources.dart';

class PendingCommissionProvider with ChangeNotifier{
  final DioClient dioClient;
  final PendingCommissionRepo pendingCommissionRepo;
  PendingCommissionProvider({required this.dioClient, required this.pendingCommissionRepo});

  PendingCommissionRequestModel? _pendingCommissionRequestModel;
  List<PendingCommissionData>? _pendingCommissionList;
  PendingCommissionData? _pendingCommissionData;
  List<String> _pendingCommissionAllList = [];

  List<String>? get pendingCommissionAllList => _pendingCommissionAllList;
  PendingCommissionRequestModel? get pendingCommissionRequestModel => _pendingCommissionRequestModel;
  List<PendingCommissionData>? get pendingCommissionList => _pendingCommissionList;
  PendingCommissionData? get pendingCommissionData => _pendingCommissionData;



  Future<String?> pendingCommission({required dynamic pageNo, required dynamic no_of_rows, required BuildContext context}) async{

    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await pendingCommissionRepo.pendingCommissionHistory(pageNo: pageNo, no_of_rows: 5);

    if(kDebugMode){
      print("pending commission statusCode >>>>>>>>>>>>>>>> ${apiResponse.response!.statusCode.toString()}");
    }

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _pendingCommissionRequestModel = PendingCommissionRequestModel.fromJson(apiResponse.response!.data);

      _pendingCommissionList = _pendingCommissionRequestModel!.data as List<PendingCommissionData>?;

      for (var element in _pendingCommissionList!) {
        _pendingCommissionAllList.add(element.totalCommission as String);
      }

      if (kDebugMode) {
        print("getDistrictTest>>>>>>>>>>>>>>>${_pendingCommissionRequestModel!.data}");
        print("_districtNameList+++++++++++++++++${_pendingCommissionAllList}");
      }

      notifyListeners();
      EasyLoading.dismiss();
    } else {
      EasyLoading.dismiss();
      ApiChecker.checkApi(context, apiResponse);
    }

  }

}