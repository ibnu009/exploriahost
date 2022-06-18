import 'package:exploriahost/core/network/response/chat/chat_message_response.dart';
import 'package:exploriahost/core/network/response/chat/chat_room_response.dart';

abstract class ChatState {}

class InitChatState extends ChatState {}

class ShowLoadingChat extends ChatState {}

class ShowEmptyChatRoom extends ChatState {}

class ShowEmptyChatMessages extends ChatState {}

class ShowChatMessages extends ChatState {
  List<ChatMessage> chats;

  ShowChatMessages(this.chats);
}

class ShowChatRooms extends ChatState {
  List<ChatRoom> chatRooms;

  ShowChatRooms(this.chatRooms);
}
