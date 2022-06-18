import 'package:exploriahost/utils/generic_delegate.dart';

abstract class ChatEvent {}

class GetChatRooms extends ChatEvent {}

class GetChatMessages extends ChatEvent {
  String uuidChatRoom;

  GetChatMessages(this.uuidChatRoom);
}

class OpenChatRoom extends ChatEvent {
  String uuidUser;
  GenericDelegate delegate;
  OpenChatRoom(this.uuidUser, this.delegate);
}

class SendChat extends ChatEvent {
  String email, message, uuidChatRoom;

  SendChat(this.email, this.message, this.uuidChatRoom);
}
