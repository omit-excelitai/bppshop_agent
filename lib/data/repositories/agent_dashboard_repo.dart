import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/datasource/remote/exception/api_error_handler.dart';
import 'package:bppshop_agent/data/model/base_model/api_response.dart';
import 'package:bppshop_agent/utill/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgentDashboardRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AgentDashboardRepo({required this.dioClient, required this.sharedPreferences});

  /// Fetch agent dashboard data
  Future<ApiResponse> getAgentDashboardData() async{
    try{
      Response response = await dioClient.get(AppConstants.agentDashboardUrl,
          // options: Options(headers:{
          //   "Content-Type": "application/json",
          //   "Authorization":
          //   "Bearer ${sharedPreferences.getString(AppConstants.token) ?? ""}",
          // })
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}