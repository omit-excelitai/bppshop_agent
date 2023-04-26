import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utill/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class PendingCommissionRepo{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  PendingCommissionRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> pendingCommissionHistory({required dynamic pageNo, required dynamic no_of_rows}) async{
    try{
      Response response = await dioClient.post(
        AppConstants.pendingCommissionUrl,
        queryParameters: {
          'page': pageNo,
          'no_of_rows' : 5,
        },
        // options: Options(headers: {
        //   "Content-Type": "application/json",
        //   "Authorization":
        //   "Bearer ${ sharedPreferences.getString(AppConstants.token) ?? ""}",
        // }),
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}