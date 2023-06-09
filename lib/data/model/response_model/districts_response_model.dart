import 'dart:convert';
/// status : "success"
/// message : "List of districts"
/// data : [{"id":1,"name":"Bagerhat "},{"id":2,"name":"Bandarban"},{"id":3,"name":"Barguna"},{"id":4,"name":"Barisal"},{"id":5,"name":"Bhola"},{"id":6,"name":"Bogra"},{"id":7,"name":"Brahmanbaria"},{"id":8,"name":"Chandpur"},{"id":9,"name":"Chittagong"},{"id":10,"name":"Chuadanga"},{"id":11,"name":"Comilla"},{"id":12,"name":"Cox's Bazar"},{"id":13,"name":"Dhaka"},{"id":14,"name":"Dinajpur"},{"id":15,"name":"Faridpur"},{"id":16,"name":"Feni"},{"id":17,"name":"Gaibandha"},{"id":18,"name":"Gazipur"},{"id":19,"name":"Gopalganj"},{"id":20,"name":"Habiganj"},{"id":21,"name":"Jaipurhat"},{"id":22,"name":"Jamalpur"},{"id":23,"name":"Jessore"},{"id":24,"name":"Jhalakati"},{"id":25,"name":"Jhenaidah"},{"id":26,"name":"Khagrachari"},{"id":27,"name":"Khulna"},{"id":28,"name":"Kishoreganj"},{"id":29,"name":"Kurigram"},{"id":30,"name":"Kushtia"},{"id":31,"name":"Lakshmipur"},{"id":32,"name":"Lalmonirhat"},{"id":33,"name":"Madaripur"},{"id":34,"name":"Magura"},{"id":35,"name":"Manikganj"},{"id":36,"name":"Meherpur"},{"id":37,"name":"Moulvibazar"},{"id":38,"name":"Munshiganj"},{"id":39,"name":"Mymensingh"},{"id":40,"name":"Naogaon"},{"id":41,"name":"Narail"},{"id":42,"name":"Narayanganj"},{"id":43,"name":"Narsingdi"},{"id":44,"name":"Natore"},{"id":45,"name":"Nawabganj"},{"id":46,"name":"Netrakona"},{"id":47,"name":"Nilphamari"},{"id":48,"name":"Noakhali"},{"id":49,"name":"Pabna"},{"id":50,"name":"Panchagarh"},{"id":51,"name":"Parbattya Chattagram"},{"id":52,"name":"Patuakhali"},{"id":53,"name":"Pirojpur"},{"id":54,"name":"Rajbari"},{"id":55,"name":"Rajshahi"},{"id":56,"name":"Rangpur"},{"id":57,"name":"Satkhira"},{"id":58,"name":"Shariatpur"},{"id":59,"name":"Sherpur"},{"id":60,"name":"Sirajganj"},{"id":61,"name":"Sunamganj"},{"id":62,"name":"Sylhet"},{"id":63,"name":"Tangail"},{"id":64,"name":"Thakurgaon"}]

DistrictsResponseModel districtsResponseModelFromJson(String str) => DistrictsResponseModel.fromJson(json.decode(str));
String districtsResponseModelToJson(DistrictsResponseModel data) => json.encode(data.toJson());
class DistrictsResponseModel {
  DistrictsResponseModel({
      String? status, 
      String? message, 
      List<DistrictData>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  DistrictsResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(DistrictData.fromJson(v));
      });
    }
  }
  String? _status;
  String? _message;
  List<DistrictData>? _data;

  String? get status => _status;
  String? get message => _message;
  List<DistrictData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Bagerhat "

DistrictData dataFromJson(String str) => DistrictData.fromJson(json.decode(str));
String dataToJson(DistrictData data) => json.encode(data.toJson());
class DistrictData {
  DistrictData({
      int? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  DistrictData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  int? _id;
  String? _name;

  int? get id => _id;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}