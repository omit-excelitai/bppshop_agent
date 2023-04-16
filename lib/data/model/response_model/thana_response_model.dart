import 'dart:convert';

ThanaModel thanaModelFromJson(String str) => ThanaModel.fromJson(json.decode(str));

String thanaModelToJson(ThanaModel data) => json.encode(data.toJson());

class ThanaModel {
  ThanaModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final List<dynamic>? data;

  factory ThanaModel.fromJson(Map<String, dynamic> json) => ThanaModel(
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
