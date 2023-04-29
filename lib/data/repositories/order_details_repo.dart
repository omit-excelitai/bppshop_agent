import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class OrderDetailsRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  OrderDetailsRepo({required this.dioClient, required this.sharedPreferences});

  /// For get order details data
  Future<ApiResponse> getOrderDetailsData({required int? id}) async{
    try{
      Response response = await dioClient.get("${AppConstants.orderDetailsUrl}$id");
      return ApiResponse.withSuccess(response);
    }catch(e){
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}