
import 'package:meta/meta.dart';
import 'dart:convert';

ScheduleDetailResponse scheduleDetailResponseFromJson(String str) => ScheduleDetailResponse.fromJson(json.decode(str));

String scheduleDetailResponseToJson(ScheduleDetailResponse data) => json.encode(data.toJson());

class ScheduleDetailResponse {
  ScheduleDetailResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  ScheduleDetail data;

  factory ScheduleDetailResponse.fromJson(Map<String, dynamic> json) => ScheduleDetailResponse(
    status: json["status"] == null ? null : json["status"],
    rowCount: json["row_count"] == null ? null : json["row_count"],
    message: json["message"] == null ? null : json["message"],
    data: ScheduleDetail.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "row_count": rowCount == null ? null : rowCount,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}

class ScheduleDetail {
  ScheduleDetail({
    required this.uuidHostSchedule,
    required this.startDate,
    required this.endDate,
    required this.touristAmount,
    required this.verificationStatus,
    required this.uuidExperience,
    required this.name,
    required this.price,
    required this.duration,
    required this.experienceImage,
    required this.imageUser,
    required this.nameUser,
    required this.uuidUser,
  });

  String uuidHostSchedule;
  DateTime startDate;
  DateTime endDate;
  int touristAmount;
  int verificationStatus;
  String uuidExperience;
  String name;
  int price;
  int duration;
  String? experienceImage;
  String? imageUser;
  String nameUser;
  String uuidUser;

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
    uuidHostSchedule: json["uuid_host_schedule"] == null ? null : json["uuid_host_schedule"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    touristAmount: json["tourist_amount"] == null ? null : json["tourist_amount"],
    verificationStatus: json["verification_status"] == null ? null : json["verification_status"],
    uuidExperience: json["uuid_experience"] == null ? null : json["uuid_experience"],
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    duration: json["duration"] == null ? null : json["duration"],
    experienceImage: json["experience_image"] == null ? null : json["experience_image"],
    imageUser: json["image_user"],
    nameUser: json["name_user"] == null ? null : json["name_user"],
    uuidUser: json["uuid_user"] == null ? null : json["uuid_user"],
  );

  Map<String, dynamic> toJson() => {
    "uuid_host_schedule": uuidHostSchedule == null ? null : uuidHostSchedule,
    "start_date": startDate == null ? null : startDate.toIso8601String(),
    "end_date": endDate == null ? null : endDate.toIso8601String(),
    "tourist_amount": touristAmount == null ? null : touristAmount,
    "verification_status": verificationStatus == null ? null : verificationStatus,
    "uuid_experience": uuidExperience == null ? null : uuidExperience,
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "duration": duration == null ? null : duration,
    "experience_image": experienceImage == null ? null : experienceImage,
    "image_user": imageUser,
    "name_user": nameUser == null ? null : nameUser,
    "uuid_user": uuidUser == null ? null : uuidUser,
  };
}

