import 'dart:convert';

ChatMessageResponse chatMessageResponseFromJson(String str) =>
    ChatMessageResponse.fromJson(json.decode(str));

String chatMessageResponseToJson(ChatMessageResponse data) =>
    json.encode(data.toJson());

class ChatMessageResponse {
  ChatMessageResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  List<ChatMessage> data;

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) =>
      ChatMessageResponse(
        status: json["status"],
        rowCount: json["row_count"],
        message: json["message"],
        data: List<ChatMessage>.from(
            json["data"].map((x) => ChatMessage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "row_count": rowCount,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChatMessage {
  ChatMessage({
    required this.id,
    required this.message,
    required this.senderEmail,
    required this.createdDate,
  });

  int id;
  String message;
  String senderEmail;
  DateTime createdDate;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        id: json["id"],
        message: json["message"],
        senderEmail: json["sender_email"],
        createdDate: DateTime.parse(json["created_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "message": message,
        "sender_email": senderEmail,
        "created_date": createdDate.toIso8601String(),
      };
}
