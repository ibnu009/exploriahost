import 'dart:convert';

ProvinceResponse provinceResponseFromJson(String str) => ProvinceResponse.fromJson(json.decode(str));

String provinceResponseToJson(ProvinceResponse data) => json.encode(data.toJson());

class ProvinceResponse {
  ProvinceResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  List<Province> data;

  factory ProvinceResponse.fromJson(Map<String, dynamic> json) => ProvinceResponse(
    status: json["status"],
    rowCount: json["row_count"],
    message: json["message"],
    data: List<Province>.from(json["data"].map((x) => Province.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "row_count": rowCount,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Province {
  Province({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
