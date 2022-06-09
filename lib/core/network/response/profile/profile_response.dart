import 'dart:convert';

import 'package:exploriahost/core/network/response/profile/host_profile.dart';

HostProfileResponse homeContentResponseFromJson(String str) =>
    HostProfileResponse.fromJson(json.decode(str));

String homeContentResponseToJson(HostProfileResponse data) =>
    json.encode(data.toJson());

class HostProfileResponse {
  HostProfileResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  HostProfile data;

  factory HostProfileResponse.fromJson(Map<String, dynamic> json) =>
      HostProfileResponse(
        status: json["status"] == null ? null : json["status"],
        rowCount: json["row_count"] == null ? null : json["row_count"],
        message: json["message"] == null ? null : json["message"],
        data: HostProfile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "row_count": rowCount == null ? null : rowCount,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toJson(),
  };
}