import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));

String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  AreaModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final List<dynamic>? data;

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
  };
}
