import 'dart:convert';

OpenChatResponse openChatResponseFromJson(String str) =>
    OpenChatResponse.fromJson(json.decode(str));

String openChatResponseToJson(OpenChatResponse data) =>
    json.encode(data.toJson());

class OpenChatResponse {
  OpenChatResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.uuidChatRoom,
  });

  int status;
  int rowCount;
  String message;
  String uuidChatRoom;

  factory OpenChatResponse.fromJson(Map<String, dynamic> json) =>
      OpenChatResponse(
        status: json["status"],
        rowCount: json["row_count"],
        message: json["message"],
        uuidChatRoom: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "row_count": rowCount,
        "message": message,
        "data": uuidChatRoom,
      };
}
