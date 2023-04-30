
import 'dart:convert';

TransactionHistoryRequestModel transactionHistoryRequestModelFromJson(String str) => TransactionHistoryRequestModel.fromJson(json.decode(str));

String transactionHistoryRequestModelToJson(TransactionHistoryRequestModel data) => json.encode(data.toJson());

class TransactionHistoryRequestModel {
  final String? status;
  final String? message;
  final Data? data;

  TransactionHistoryRequestModel({
    this.status,
    this.message,
    this.data,
  });

  factory TransactionHistoryRequestModel.fromJson(Map<String, dynamic> json) => TransactionHistoryRequestModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  final int? total;
  final dynamic page;
  final int? noOfRows;
  final List<dynamic>? transactionHistoryList;

  Data({
    this.total,
    this.page,
    this.noOfRows,
    this.transactionHistoryList,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    page: json["page"],
    noOfRows: json["no_of_rows"],
    transactionHistoryList: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "no_of_rows": noOfRows,
    "data": transactionHistoryList == null ? [] : List<dynamic>.from(transactionHistoryList!.map((x) => x)),
  };
}
