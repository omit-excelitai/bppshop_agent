
import 'package:bppshop_agent/data/repositories/update_agent_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/base_model/error_response.dart';
import '../utill/app_color_resources.dart';

class UpdateAgentProfileProvider with ChangeNotifier{

  final DioClient dioClient;
  final UpdateAgentProfileRepo updateAgentProfileRepo;
  bool _isLoading = false;

  UpdateAgentProfileProvider({required this.dioClient, required this.updateAgentProfileRepo});

  bool get isLoading => _isLoading;

  /// Update agent profile
  Future<String?> updateAgentProfile({required dynamic agent_name, required dynamic district_id, required dynamic thana_id, required dynamic area_id, required BuildContext context}) async{

    _isLoading = true;
    EasyLoading.show(status: 'Loading...');
    notifyListeners();
    ApiResponse apiResponse = await updateAgentProfileRepo.updateAgentProfileData(
        agent_name: agent_name.toString(),
        district_id: district_id.toString(),
        thana_id: thana_id.toString(),
        area_id: area_id.toString());

    print("Check district, thana, area id---------------------${district_id.toString()}, ${thana_id.toString()}, ${area_id.toString()}");

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      _isLoading = false;
      EasyLoading.dismiss();
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(apiResponse.response!.data["message"]),
        backgroundColor: AppColorResources.primaryMaterial,
      ));
      notifyListeners();
      return apiResponse.response!.data["status"];
    }
    else {
      EasyLoading.dismiss();
      notifyListeners();
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.error![0].message);
        errorMessage = errorResponse.error![0].message;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ));
      }
      notifyListeners();
      return apiResponse.response!.data["status"];
    }
  }
}