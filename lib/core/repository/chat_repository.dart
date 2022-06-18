import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/chat/chat_message_response.dart';
import 'package:exploriahost/core/network/response/chat/chat_room_response.dart';
import 'package:exploriahost/core/network/response/chat/open_chat_response.dart';
import 'package:exploriahost/core/network/response/generic_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChatRepository extends NetworkService {
  ChatRepository();

  final storage = const FlutterSecureStorage();

  ChatRepository._privateConstructor();

  static final ChatRepository _instance = ChatRepository._privateConstructor();

  static ChatRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";
  final String token = "token";

  Future<ChatRoomResponse> fetchChatRooms() async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod("$BASE_URL/api/host/chat/chat-rooms", header);

    return ChatRoomResponse.fromJson(map);
  }

  Future<ChatMessageResponse> fetchChatMessages(String uuidChatRoom) async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod("$BASE_URL/api/host/chat/$uuidChatRoom", header);

    return ChatMessageResponse.fromJson(map);
  }

  Future<OpenChatResponse> initiatingChatRoom(String uuidUser) async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map =
        await getMethod("$BASE_URL/api/host/chat/open-chat/$uuidUser", header);

    return OpenChatResponse.fromJson(map);
  }

  Future<GenericResponse> sendMessage(
      String email, String message, String uuidChatRoom) async {
    String? readData = await storage.read(key: 'token') ?? "";

    var body = {
      "sender_email": email,
      "message": message,
      "uuid_chat_room": uuidChatRoom
    };

    var header = {contentType: applicationJson, token: readData};
    var map =
        await postMethod("$BASE_URL/api/host/chat/send-message", body: body,  headers: header);

    return GenericResponse.fromJson(map);
  }
}
