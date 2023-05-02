
import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/model/base_model/api_response.dart';
import 'package:bppshop_agent/data/model/response_model/agent_dashboard_response_model.dart';
import 'package:bppshop_agent/data/repositories/agent_dashboard_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/model/base_model/error_response.dart';

class AgentDashboardProvider with ChangeNotifier{

  final DioClient dioClient;
  final AgentDashboardRepo agentDashboardRepo;
  AgentDashboardModel? _agentDashboardModelData;
  bool _isLoading = false;

  AgentDashboardProvider({required this.agentDashboardRepo, required this.dioClient});

  bool get isLoading => _isLoading;
  AgentDashboardModel? get agentDashboardModelData => _agentDashboardModelData;

  /// Fetch Agent Dashboard Data
  Future<String?> getAgentDashboard(BuildContext context) async{
    EasyLoading.show(status: 'loading...');
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await agentDashboardRepo.getAgentDashboardData();
    if(apiResponse.response != null && apiResponse.response!.statusCode == 200){
      _agentDashboardModelData = AgentDashboardModel.fromJson(apiResponse.response!.data);

      if(kDebugMode){
        print("apiResponse.response!.data...........${apiResponse.response!.data}");
      }

      _agentDashboardModelData = _agentDashboardModelData;
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