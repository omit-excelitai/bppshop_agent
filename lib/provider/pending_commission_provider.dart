

import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/model/request_model/pending_commission_request_model.dart';
import 'package:bppshop_agent/data/repositories/pending_commission_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../data/model/base_model/api_response.dart';
import '../data/model/base_model/error_response.dart';
import '../utill/app_color_resources.dart';

class PendingCommissionProvider with ChangeNotifier{
  final DioClient dioClient;
  final PendingCommissionRepo pendingCommissionRepo;
  PendingCommissionProvider({required this.dioClient, required this.pendingCommissionRepo});

  PendingCommissionRequestModel? _pendingCommissionRequestModel;
  List<PendingCommissionData>? _pendingCommissionList;
  PendingCommissionData? _pendingCommissionData;

  PendingCommissionRequestModel? get pendingCommissionRequestModel => _pendingCommissionRequestModel;
  List<PendingCommissionData>? get pendingCommissionList => _pendingCommissionList;
  PendingCommissionData? get pendingCommissionData => _pendingCommissionData;



  Future<String?> pendingCommission({required dynamic pageNo, required dynamic no_of_rows, required BuildContext context}) async{

    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await pendingCommissionRepo.pendingCommissionHistory(pageNo: pageNo, no_of_rows: 5);

    if(kDebugMode){
      print("addNewAddress statusCode >>>>>>>>>>>>>>>> ${apiResponse.response!.statusCode.toString()}");
    }

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      EasyLoading.dismiss();

      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiResponse.response!.data["message"]),
        backgroundColor: AppColorResources.primaryOrange,
      ));
      notifyListeners();
      return apiResponse.response!.data["status"];
    }
    else {
      EasyLoading.dismiss();
      notifyListeners();
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.error![0].message);
        errorMessage = errorResponse.error![0].message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
      notifyListeners();
      return apiResponse.response!.data["status"];
    }
  }

}