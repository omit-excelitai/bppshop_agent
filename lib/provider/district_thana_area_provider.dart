
import 'package:bppshop_agent/data/repositories/district_thana_area_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../data/datasource/remote/dio/dio_client.dart';
import '../data/model/base_model/api_response.dart';
import '../data/model/response_model/area_response_model.dart';
import '../data/model/response_model/districts_response_model.dart';
import '../data/model/response_model/thana_response_model.dart';
import '../helper/api_checker.dart';

class DistrictThanaAreaProvider with ChangeNotifier{
  final DioClient dioClient;
  final DistrictThanaAreaRepo districtThanaAreaRepo;
  DistrictThanaAreaProvider({required this.dioClient, required this.districtThanaAreaRepo});

  /// For District
  DistrictsResponseModel? _districtModel;
  DistrictsResponseModel? get districtModel => _districtModel;
  List<DistrictData>? _districtDataList;
  List<DistrictData>? get districtDataList => _districtDataList;
  DistrictData? _selectedDistrictData;
  DistrictData? get selectedDistrictData => _selectedDistrictData;
  final List<String> _districtNameList = [];
  String? districtDropdownValue;
  String? get getDistrictDropdownValue=> districtDropdownValue;
  int? districtId;
  List<String>? get districtNameList => _districtNameList;
  int? _selectedDistrictIndex = 0;
  int? _selectedAreaIndex = 0;
  int? get selectedDistrictIndex => _selectedDistrictIndex;
  int? get selectedAreaIndex => _selectedAreaIndex;


  /// For Thana
  ThanaResponseModel? _thanaModel;
  ThanaResponseModel? get thanaModel => _thanaModel;
  List<ThanaData>? _thanaDataList;
  List<ThanaData>? get thanaDataList => _thanaDataList;
  ThanaData? _selectedThanaData;
  ThanaData? get selectedThanaData => _selectedThanaData;
  List<String> _thanaNameList = [];
  List<String>? get thanaNameList => _thanaNameList;
  int? thanaId;
  String? thanaDropdownValue;

  /// For Area
  AreaResponseModel? _areaModel;
  AreaResponseModel? get areaModel => _areaModel;
  List<AreaData>? _areaDataList;
  List<AreaData>? get areaDataList => _areaDataList;
  AreaData? _selectedAreaData;
  AreaData? get selectedAreaData => _selectedAreaData;
  List<String> _areaNameList = [];
  List<String>? get areaNameList => _areaNameList;
  int? areaId;
  String? areaDropdownValue;

  // /// For Select District
  // void selectDistrictIndex(int index) {
  //   _selectedDistrictIndex = index;
  //   notifyListeners();
  // }
  //
  // /// For Select Area
  // void selectAreaIndex(int index) {
  //   _selectedAreaIndex = index;
  //   notifyListeners();
  // }

  /// Fetch District Data
  Future<void> getDistrict(bool reload, BuildContext context) async {
    //_districtNameList.clear();
    clearData();
    EasyLoading.show(status: 'loading...');
    if (_districtModel == null || reload) {
      ApiResponse apiResponse = await districtThanaAreaRepo.getAllDistrictData();
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _districtModel = DistrictsResponseModel.fromJson(apiResponse.response!.data);

        _districtDataList = _districtModel!.data;

        for (var element in _districtDataList!) {
          _districtNameList.add(element.name!);
        }

        if (kDebugMode) {
          print("getDistrictTest>>>>>>>>>>>>>>>${_districtModel!.data![0].name}");
          print("_districtNameList+++++++++++++++++${_districtNameList}");
        }

        notifyListeners();
        EasyLoading.dismiss();
      } else {
        EasyLoading.dismiss();
        ApiChecker.checkApi(context, apiResponse);
      }
    }
  }

  /// Fetch Thana Data
  Future<void> getThana(bool reload, BuildContext context) async {
    //  _thanaNameList=[];
    // _thanaNameList.clear();
    EasyLoading.show(status: 'loading...');
    if (_thanaModel == null || reload) {
      ApiResponse apiResponse = await districtThanaAreaRepo.getAllThanaData(districtId: districtId);
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _thanaModel = ThanaResponseModel.fromJson(apiResponse.response!.data);

        _thanaDataList = _thanaModel!.data;

        for (var element in _thanaDataList!) {
          _thanaNameList.add(element.name!);
        }

        if (kDebugMode) {
          print("getDistrictTest>>>>>>>>>>>>>>>${_thanaModel!.data![0].name}");
          print("_thanaNameList+++++++++++++++++${_thanaNameList}");
        }
        notifyListeners();
        EasyLoading.dismiss();
      } else {
        ApiChecker.checkApi(context, apiResponse);
        EasyLoading.dismiss();
      }
    }
  }

  /// Fetch Area Data
  Future<void> getArea(bool reload, BuildContext context) async {
    EasyLoading.show(status: 'loading...');
    if (_areaModel == null || reload) {
      ApiResponse apiResponse = await districtThanaAreaRepo.getAllAreaData(thanaId: thanaId);
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _areaModel = AreaResponseModel.fromJson(apiResponse.response!.data);

        _areaDataList = _areaModel!.data;

        for (var element in _areaDataList!) {
          _areaNameList.add(element.name!);
        }

        if (kDebugMode) {
          print("getDistrictTest>>>>>>>>>>>>>>>${_areaModel!.data![0].name}");
          print("_thanaNameList+++++++++++++++++$_areaNameList");
        }
        notifyListeners();
        EasyLoading.dismiss();
      } else {
        ApiChecker.checkApi(context, apiResponse);
        EasyLoading.dismiss();
      }
    }
  }

  changeDistrictDropDownValue(String dropdownValue) {
    districtDropdownValue = dropdownValue;
    notifyListeners();
    _selectedDistrictData = _districtModel!.data!.firstWhere((element) => element.name!.contains(dropdownValue));

    districtId = int.parse(_selectedDistrictData!.id.toString());

    if(kDebugMode){
      print("Selected_DistrictId>>>>>> $districtId");
    }
    notifyListeners();
  }

  changeThanaDropDownValue(String dropdownValue) {
    thanaDropdownValue = dropdownValue;
    notifyListeners();
    _selectedThanaData = _thanaModel!.data!.firstWhere((element) => element.name!.contains(dropdownValue));

    thanaId = int.parse(_selectedThanaData!.id.toString());

    if(kDebugMode){
      print("Selected_ThanaId>>>>>> $thanaId");
    }
    notifyListeners();
  }

  ///
  changeAreaDropDownValue(String dropdownValue) {
    areaDropdownValue = dropdownValue;
    notifyListeners();
    _selectedAreaData = _areaModel!.data!.firstWhere((element) => element.name!.contains(dropdownValue));

    areaId = int.parse(_selectedAreaData!.id.toString());

    if(kDebugMode){
      print("Selected_ThanaId>>>>>> $areaId");
    }
    notifyListeners();
  }


  /// For clear data
  void clearData() {
    districtDropdownValue = null;
    thanaDropdownValue = null;
    areaDropdownValue = null;
    _districtNameList.clear();
    _thanaNameList.clear();
    _areaNameList.clear();
    notifyListeners();
  }

}