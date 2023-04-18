// To parse this JSON data, do
//
//     final areaResponseModel = areaResponseModelFromJson(jsonString);

import 'dart:convert';

AreaResponseModel areaResponseModelFromJson(String str) => AreaResponseModel.fromJson(json.decode(str));

String areaResponseModelToJson(AreaResponseModel data) => json.encode(data.toJson());

class AreaResponseModel {
  AreaResponseModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final List<AreaData>? data;

  factory AreaResponseModel.fromJson(Map<String, dynamic> json) => AreaResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<AreaData>.from(json["data"]!.map((x) => AreaData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AreaData {
  AreaData({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory AreaData.fromJson(Map<String, dynamic> json) => AreaData(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
