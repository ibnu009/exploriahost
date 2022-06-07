import 'dart:convert';

ScheduleItemResponse scheduleItemResponseFromJson(String str) =>
    ScheduleItemResponse.fromJson(json.decode(str));

String scheduleItemResponseToJson(ScheduleItemResponse data) =>
    json.encode(data.toJson());

class ScheduleItemResponse {
  ScheduleItemResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  List<Schedule> data;

  factory ScheduleItemResponse.fromJson(Map<String, dynamic> json) =>
      ScheduleItemResponse(
        status: json["status"] == null ? null : json["status"],
        rowCount: json["row_count"] == null ? null : json["row_count"],
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null
            ? []
            : List<Schedule>.from(
                json["data"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "row_count": rowCount == null ? null : rowCount,
        "message": message == null ? null : message,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Schedule {
  Schedule(
      {required this.uuidHostSchedule,
      required this.startDate,
      required this.endDate,
      required this.verificationStatus,
      required this.name});

  String uuidHostSchedule;
  int startDate;
  int endDate;
  int verificationStatus;
  String name;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        uuidHostSchedule: json["uuid_host_schedule"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        verificationStatus: json["verification_status"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "uuid_host_schedule":
            uuidHostSchedule == null ? null : uuidHostSchedule,
        "start_date": startDate == null ? null : startDate,
        "end_date": endDate == null ? null : endDate,
        "verification_status":
            verificationStatus == null ? null : verificationStatus,
        "name": name == null ? null : name,
      };
}
