import 'dart:convert';

CityResponse cityResponseFromJson(String str) => CityResponse.fromJson(json.decode(str));

String cityResponseToJson(CityResponse data) => json.encode(data.toJson());

class CityResponse {
  CityResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  List<City> data;

  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
    status: json["status"],
    rowCount: json["row_count"],
    message: json["message"],
    data: List<City>.from(json["data"].map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "row_count": rowCount,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class City {
  City({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
