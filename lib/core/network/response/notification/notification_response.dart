import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) =>
    NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) =>
    json.encode(data.toJson());

class NotificationResponse {
  NotificationResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  List<Notifications> data;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      NotificationResponse(
        status: json["status"],
        rowCount: json["row_count"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Notifications>.from(json["data"].map((x) => Notifications.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "row_count": rowCount,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Notifications {
  Notifications({
    required this.id,
    required this.title,
    required this.message,
    required this.readStatus,
    required this.createDate,
    required this.uuidHost,
  });

  int id;
  String title;
  String message;
  int readStatus;
  DateTime createDate;
  String uuidHost;

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
    id: json["id"],
    title: json["title"],
    message: json["message"],
    readStatus: json["read_status"],
    createDate: DateTime.parse(json["create_date"]),
    uuidHost: json["uuid_host"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "message": message,
    "read_status": readStatus,
    "create_date": createDate.toIso8601String(),
    "uuid_host": uuidHost,
  };
}
