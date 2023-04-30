import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class UpdateAgentProfileRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  UpdateAgentProfileRepo({ required this.dioClient, required this.sharedPreferences});

  /// Update Agent Profile Data
  Future<ApiResponse> updateAgentProfileData({required dynamic agent_name, required dynamic district_id, required dynamic thana_id, required dynamic area_id}) async{
    try{
      Response response = await dioClient.post(
        AppConstants.updateAgentProfileUrl,
        data: {
          'agent_name': agent_name.toString(),
          'district_id' : district_id.toString(),
          'thana_id' : thana_id.toString(),
          'area_id' : area_id.toString()
        },
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}