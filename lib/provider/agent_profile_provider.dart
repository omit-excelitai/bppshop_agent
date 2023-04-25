
import 'package:bppshop_agent/data/model/base_model/api_response.dart';
import 'package:bppshop_agent/data/model/base_model/error_response.dart';
import 'package:bppshop_agent/data/model/response_model/agent_profile_response_model.dart';
import 'package:bppshop_agent/data/repositories/agent_profile_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../data/datasource/remote/dio/dio_client.dart';

class AgentProfileProvider with ChangeNotifier{
  DioClient dioClient;
  final AgentProfileRepo agentProfileRepo;
  AgentProfileProvider({required this.agentProfileRepo, required this.dioClient});

  AgentProfileModel? _agentProfileModelData;
  //Data? _agentProfileData;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  //Data? get agentProfileData => _agentProfileData;
  AgentProfileModel? get agentProfileModelData => _agentProfileModelData;

  Future<String?> getAgentProfileData(BuildContext context) async{
    EasyLoading.show(status: 'loading...');
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await agentProfileRepo.getAgentProfileData();
    if(apiResponse.response != null && apiResponse.response!.statusCode == 200){
      _agentProfileModelData = AgentProfileModel.fromJson(apiResponse.response!.data);

      if(kDebugMode){
        print("apiResponse.response!.data...........${apiResponse.response!.data}");
      }

      _agentProfileModelData = _agentProfileModelData;
      _isLoading = false;
      EasyLoading.dismiss();
      notifyListeners();
    }
    else {
      _isLoading = false;
      EasyLoading.dismiss();
      notifyListeners();
      String errorMessage;

      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.error![0].message);
        errorMessage = errorResponse.error![0].message;
      }
      notifyListeners();
    }
    notifyListeners();
    return apiResponse.response!.data["status"];
  }

}