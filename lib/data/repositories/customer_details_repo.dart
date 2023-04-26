import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/model/base_model/api_response.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';

class CustomerDetailsRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  CustomerDetailsRepo({required this.dioClient, required this.sharedPreferences});

  /// Call Customer Details API
  Future<ApiResponse> getCustomerDetails({required int? id}) async{
    try{
      Response response = await dioClient.get("${AppConstants.customerDetailsUrl}$id");
      return ApiResponse.withSuccess(response);
    }catch(e){
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}