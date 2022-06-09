import 'dart:convert';

import 'package:exploriahost/core/network/response/profile/host_profile.dart';
import 'package:exploriahost/core/network/response/schedule/schedule_item_response.dart';

HomeContentResponse homeContentResponseFromJson(String str) =>
    HomeContentResponse.fromJson(json.decode(str));

String homeContentResponseToJson(HomeContentResponse data) =>
    json.encode(data.toJson());

class HomeContentResponse {
  HomeContentResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  HomeContent data;

  factory HomeContentResponse.fromJson(Map<String, dynamic> json) =>
      HomeContentResponse(
        status: json["status"] == null ? null : json["status"],
        rowCount: json["row_count"] == null ? null : json["row_count"],
        message: json["message"] == null ? null : json["message"],
        data: HomeContent.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "row_count": rowCount == null ? null : rowCount,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
      };
}

class HomeContent {
  HomeContent({
    required this.hostProfile,
    required this.schedules,
  });

  HostProfile hostProfile;
  List<Schedule> schedules;

  factory HomeContent.fromJson(Map<String, dynamic> json) => HomeContent(
        hostProfile: HostProfile.fromJson(json["host_profile"]),
        schedules: json["schedules"] == null
            ? []
            : List<Schedule>.from(
                json["schedules"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "host_profile": hostProfile == null ? null : hostProfile.toJson(),
        "schedules": schedules == null
            ? null
            : List<dynamic>.from(schedules.map((x) => x.toJson())),
      };
}
