import 'dart:convert';

AgentProfileModel agentProfileModelFromJson(String str) => AgentProfileModel.fromJson(json.decode(str));

String agentProfileModelToJson(AgentProfileModel data) => json.encode(data.toJson());

class AgentProfileModel {
  AgentProfileModel({
    this.status,
    this.message,
    this.role,
    this.data,
  });

  final String? status;
  final String? message;
  final String? role;
  final Data? data;

  factory AgentProfileModel.fromJson(Map<String, dynamic> json) => AgentProfileModel(
    status: json["status"],
    message: json["message"],
    role: json["role"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "role": role,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.phone,
    this.email,
    this.name,
    this.walletBalance,
    this.address,
    this.zoneId,
    this.divisionId,
    this.districtId,
    this.thanaId,
    this.areaId,
    this.cityId,
    this.password,
    this.image,
    this.isVerified,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.districtName,
    this.thanaName,
    this.areaName,
    this.district,
    this.thana,
    this.area,
  });

  final int? id;
  final String? phone;
  final String? email;
  final String? name;
  final int? walletBalance;
  final String? address;
  final dynamic zoneId;
  final dynamic divisionId;
  final int? districtId;
  final int? thanaId;
  final int? areaId;
  final dynamic cityId;
  final String? password;
  final String? image;
  final int? isVerified;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;
  final String? districtName;
  final String? thanaName;
  final String? areaName;
  final District? district;
  final Thana? thana;
  final Area? area;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    phone: json["phone"],
    email: json["email"],
    name: json["name"],
    walletBalance: json["wallet_balance"],
    address: json["address"],
    zoneId: json["zone_id"],
    divisionId: json["division_id"],
    districtId: json["district_id"],
    thanaId: json["thana_id"],
    areaId: json["area_id"],
    cityId: json["city_id"],
    password: json["password"],
    image: json["image"],
    isVerified: json["is_verified"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    districtName: json["district_name"],
    thanaName: json["thana_name"],
    areaName: json["area_name"],
    district: json["district"] == null ? null : District.fromJson(json["district"]),
    thana: json["thana"] == null ? null : Thana.fromJson(json["thana"]),
    area: json["area"] == null ? null : Area.fromJson(json["area"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phone": phone,
    "email": email,
    "name": name,
    "wallet_balance": walletBalance,
    "address": address,
    "zone_id": zoneId,
    "division_id": divisionId,
    "district_id": districtId,
    "thana_id": thanaId,
    "area_id": areaId,
    "city_id": cityId,
    "password": password,
    "image": image,
    "is_verified": isVerified,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "district_name": districtName,
    "thana_name": thanaName,
    "area_name": areaName,
    "district": district?.toJson(),
    "thana": thana?.toJson(),
    "area": area?.toJson(),
  };
}

class Area {
  Area({
    this.id,
    this.name,
    this.postCode,
    this.districtId,
    this.upazilaId,
    this.status,
    this.createdAdminId,
    this.updatedAdminId,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? postCode;
  final int? districtId;
  final int? upazilaId;
  final int? status;
  final int? createdAdminId;
  final dynamic updatedAdminId;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    id: json["id"],
    name: json["name"],
    postCode: json["post_code"],
    districtId: json["district_id"],
    upazilaId: json["upazila_id"],
    status: json["status"],
    createdAdminId: json["created_admin_id"],
    updatedAdminId: json["updated_admin_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "post_code": postCode,
    "district_id": districtId,
    "upazila_id": upazilaId,
    "status": status,
    "created_admin_id": createdAdminId,
    "updated_admin_id": updatedAdminId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class District {
  District({
    this.id,
    this.name,
    this.serviceAreaId,
    this.divisionId,
    this.homeDelivery,
    this.lockDownService,
    this.status,
    this.createdAdminId,
    this.updatedAdminId,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? name;
  final int? serviceAreaId;
  final int? divisionId;
  final int? homeDelivery;
  final int? lockDownService;
  final int? status;
  final int? createdAdminId;
  final dynamic updatedAdminId;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory District.fromJson(Map<String, dynamic> json) => District(
    id: json["id"],
    name: json["name"],
    serviceAreaId: json["service_area_id"],
    divisionId: json["division_id"],
    homeDelivery: json["home_delivery"],
    lockDownService: json["lock_down_service"],
    status: json["status"],
    createdAdminId: json["created_admin_id"],
    updatedAdminId: json["updated_admin_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "service_area_id": serviceAreaId,
    "division_id": divisionId,
    "home_delivery": homeDelivery,
    "lock_down_service": lockDownService,
    "status": status,
    "created_admin_id": createdAdminId,
    "updated_admin_id": updatedAdminId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Thana {
  Thana({
    this.id,
    this.districtId,
    this.name,
    this.thanaCode,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  final int? id;
  final int? districtId;
  final String? name;
  final dynamic thanaCode;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? status;

  factory Thana.fromJson(Map<String, dynamic> json) => Thana(
    id: json["id"],
    districtId: json["district_id"],
    name: json["name"],
    thanaCode: json["thana_code"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "district_id": districtId,
    "name": name,
    "thana_code": thanaCode,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "status": status,
  };
}
