import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/base_model/api_response.dart';

class TransactionHistoryRepo{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  TransactionHistoryRepo({ required this.dioClient, required this.sharedPreferences});

  /// Call Transaction History API
  Future<ApiResponse> getTransactionHistoryData({required dynamic pageNo, required dynamic no_of_rows}) async{
    try{
      Response response = await dioClient.post(
        AppConstants.transactionHistoryUrl,
        data: {
          'page': pageNo,
          'no_of_rows' : no_of_rows,
        },
      );
      return ApiResponse.withSuccess(response);
    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}