
import 'dart:convert';

ThanaResponseModel thanaResponseModelFromJson(String str) => ThanaResponseModel.fromJson(json.decode(str));

String thanaResponseModelToJson(ThanaResponseModel data) => json.encode(data.toJson());

class ThanaResponseModel {
  ThanaResponseModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final List<ThanaData>? data;

  factory ThanaResponseModel.fromJson(Map<String, dynamic> json) => ThanaResponseModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ThanaData>.from(json["data"]!.map((x) => ThanaData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ThanaData {
  ThanaData({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory ThanaData.fromJson(Map<String, dynamic> json) => ThanaData(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
