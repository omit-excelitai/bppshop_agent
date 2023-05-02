import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class UpdateCustomerProfileRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  UpdateCustomerProfileRepo({required this.dioClient, required this.sharedPreferences});

  /// Update Customer Profile
  Future<ApiResponse> updateCustomerProfileData({required dynamic customer_name, required dynamic customer_address, required dynamic customer_id}) async{
    try{
      Response response = await dioClient.post(
        AppConstants.updateCustomerProfileUrl,
        data: {
          'customer_name': customer_name,
          'customer_address' : customer_address,
          'customer_id' : customer_id
        },
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}