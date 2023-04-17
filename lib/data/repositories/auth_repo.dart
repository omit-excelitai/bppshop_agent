import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/datasource/remote/exception/api_error_handler.dart';
import 'package:bppshop_agent/data/model/base_model/api_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utill/app_constants.dart';

class AuthRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  /// For Login

  Future<ApiResponse> login({required String number, required String password}) async{
    try{
      Response response = await dioClient.post(
          AppConstants.loginUrl,
        queryParameters: {
            'agent_mobile_number': number,
          'password' : password,
        }
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  /// for user token

  Future<void> saveUserToken(String token) async {
    dioClient.updateHeader(token, "");
    try {
      await sharedPreferences.setString(AppConstants.token, token);
      print("========>Token Stored<=======");
      print(await sharedPreferences.getString(AppConstants.token));
    } catch (e) {
      throw e;
    }
  }


}