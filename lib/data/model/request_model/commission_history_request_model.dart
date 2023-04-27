
import 'dart:convert';

CommissionHistoryRequestModel commissionHistoryRequestModelFromJson(String str) => CommissionHistoryRequestModel.fromJson(json.decode(str));

String commissionHistoryRequestModelToJson(CommissionHistoryRequestModel data) => json.encode(data.toJson());

class CommissionHistoryRequestModel {
  CommissionHistoryRequestModel({
    this.status,
    this.message,
    this.data,
  });

  final String? status;
  final String? message;
  final Data? data;

  factory CommissionHistoryRequestModel.fromJson(Map<String, dynamic> json) => CommissionHistoryRequestModel(
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
  Data({
    this.total,
    this.page,
    this.noOfRows,
    this.commissionHistoryList,
  });

  final int? total;
  final int? page;
  final int? noOfRows;
  final List<dynamic>? commissionHistoryList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    page: json["page"],
    noOfRows: json["no_of_rows"],
    commissionHistoryList: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "no_of_rows": noOfRows,
    "data": commissionHistoryList == null ? [] : List<dynamic>.from(commissionHistoryList!.map((x) => x)),
  };
}
