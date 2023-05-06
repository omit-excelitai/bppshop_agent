import 'package:bppshop_agent/data/datasource/remote/dio/dio_client.dart';
import 'package:bppshop_agent/data/model/base_model/api_response.dart';
import 'package:bppshop_agent/data/model/base_model/error_response.dart';
import 'package:bppshop_agent/data/repositories/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utill/app_color_resources.dart';

class AuthProvider with ChangeNotifier{
  final DioClient dioClient;
  final AuthRepo authRepo;
  bool _isLoading = false;

  AuthProvider({required this.dioClient, required this.authRepo});

  bool get isLoading => _isLoading;

  /// For Login
  Future<String?> login({required String number, required String password, required BuildContext context}) async{
    _isLoading = true;
    notifyListeners();

    ApiResponse apiResponse = await authRepo.login(number: number, password: password);

    if(apiResponse.response != null && apiResponse.response!.data["status"]=="success"){
      _isLoading = false;
      Map map = apiResponse.response?.data;

      String token = '';
      String message = '';

      try{
        message = map["message"];
        token = map["token"];

        if(kDebugMode){
          print("--------------message----------------------->>>>>$message");
          print("--------------token----------------------->>>>>$token");
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(message),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
          backgroundColor: AppColorResources.primaryMaterial,
        ));


      }catch(e){

      }

      if(token.isNotEmpty){
        authRepo.saveUserToken(token);
      }
      notifyListeners();
    }

    else{
      _isLoading = false;
      notifyListeners();
      if(apiResponse.response != null && apiResponse.response!.statusCode==200){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(apiResponse.response!.data["message"]),
          elevation: 6.0,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ));
      }

      String errorMessage;
      if(apiResponse.error is String){
        if(kDebugMode){
          print(apiResponse.error.toString());
        }
        errorMessage = apiResponse.error.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('${errorMessage}'),
          backgroundColor: Colors.red,
        ));
      }
      else{
        ErrorResponse errorResponse = apiResponse.error;
        if(kDebugMode){
          print(errorResponse.error![0].message);
        }
        errorMessage = errorResponse.error![0].message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
      notifyListeners();
    }
    if (kDebugMode) {
      print("response.statusCode${apiResponse.response!.statusCode}");
    }
    return apiResponse.response!.data["status"];
  }

  /// For auth token
  Future authToken(String authToken ) async{
    authRepo.saveAuthToken(authToken);
    notifyListeners();
  }

  /// Get user token
  dynamic getUserToken(){
    print(authRepo.getUserToken());
    return authRepo.getUserToken();
  }

}