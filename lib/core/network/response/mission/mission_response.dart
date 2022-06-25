// To parse this JSON data, do
//
//     final missionResponse = missionResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MissionResponse missionResponseFromJson(String str) => MissionResponse.fromJson(json.decode(str));

String missionResponseToJson(MissionResponse data) => json.encode(data.toJson());

class MissionResponse {
  MissionResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  List<Mission> data;

  factory MissionResponse.fromJson(Map<String, dynamic> json) => MissionResponse(
    status: json["status"],
    rowCount: json["row_count"],
    message: json["message"],
    data: List<Mission>.from(json["data"].map((x) => Mission.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "row_count": rowCount,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Mission {
  Mission({
    required this.uuidMission,
    required this.name,
    required this.description,
    required this.address,
    required this.imageUrl,
    required this.point,
    required this.maxContributor,
    required this.currentContributor,
    required this.deadline,
    required this.provinceId,
    required this.cityId,
  });

  String uuidMission;
  String name;
  String description;
  String address;
  String imageUrl;
  int point;
  int maxContributor;
  int currentContributor;
  DateTime deadline;
  int provinceId;
  int cityId;

  factory Mission.fromJson(Map<String, dynamic> json) => Mission(
    uuidMission: json["uuid_mission"],
    name: json["name"],
    description: json["description"],
    address: json["address"],
    imageUrl: json["image_url"],
    point: json["point"],
    maxContributor: json["max_contributor"],
    currentContributor: json["current_contributor"],
    deadline: DateTime.parse(json["deadline"]),
    provinceId: json["province_id"],
    cityId: json["city_id"],
  );

  Map<String, dynamic> toJson() => {
    "uuid_mission": uuidMission,
    "name": name,
    "description": description,
    "address": address,
    "image_url": imageUrl,
    "point": point,
    "max_contributor": maxContributor,
    "current_contributor": currentContributor,
    "deadline": deadline.toIso8601String(),
    "province_id": provinceId,
    "city_id": cityId,
  };
}
