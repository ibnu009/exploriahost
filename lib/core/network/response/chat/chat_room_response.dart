import 'dart:convert';

ChatRoomResponse chatRoomResponseFromJson(String str) =>
    ChatRoomResponse.fromJson(json.decode(str));

String chatRoomResponseToJson(ChatRoomResponse data) =>
    json.encode(data.toJson());

class ChatRoomResponse {
  ChatRoomResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  List<ChatRoom> data;

  factory ChatRoomResponse.fromJson(Map<String, dynamic> json) =>
      ChatRoomResponse(
        status: json["status"],
        rowCount: json["row_count"],
        message: json["message"],
        data: json["data"] == null ? [] :
            List<ChatRoom>.from(json["data"].map((x) => ChatRoom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "row_count": rowCount,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ChatRoom {
  ChatRoom({
    required this.uuidChatRoom,
    required this.imageUrl,
    required this.name,
    required this.lastMessage,
  });

  String uuidChatRoom;
  String imageUrl;
  String name;
  String lastMessage;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        uuidChatRoom: json["uuid_chat_room"],
        imageUrl: json["image_url"],
        name: json["name"],
        lastMessage: json["last_message"],
      );

  Map<String, dynamic> toJson() => {
        "uuid_chat_room": uuidChatRoom,
        "image_url": imageUrl,
        "name": name,
        "last_message": lastMessage,
      };
}
