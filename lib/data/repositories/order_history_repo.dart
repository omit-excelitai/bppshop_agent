import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class OrderHistoryRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  OrderHistoryRepo({required this.dioClient, required this.sharedPreferences});

  /// Call Order History API
  Future<ApiResponse> orderHistoryData({required dynamic pageNo, required dynamic no_of_rows}) async{
    try{
      Response response = await dioClient.post(
        AppConstants.orderHistoryUrl,
        queryParameters: {
          'page': pageNo,
          'no_of_rows' : 5,
        },
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}