

import 'dart:convert';

LoginRequestModel loginRequestModelFromJson(String str) => LoginRequestModel.fromJson(json.decode(str));

String loginRequestModelToJson(LoginRequestModel data) => json.encode(data.toJson());

class LoginRequestModel {
  LoginRequestModel({
    this.status,
    this.message,
    this.isVerified,
    this.token,
  });

  final String? status;
  final String? message;
  final int? isVerified;
  final String? token;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) => LoginRequestModel(
    status: json["status"],
    message: json["message"],
    isVerified: json["is_verified"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "is_verified": isVerified,
    "token": token,
  };
}
