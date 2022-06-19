import 'dart:async';

import 'package:exploriahost/core/network/response/chat/chat_message_response.dart';
import 'package:exploriahost/core/repository/chat_repository.dart';
import 'package:exploriahost/modules/chat/bloc/chat_even.dart';
import 'package:exploriahost/modules/chat/bloc/chat_state.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late ChatRepository _repository;
  late GenericDelegate _delegate;

  final List<ChatMessage> _chats = [];
  final duration = const Duration(seconds: 30);

  final _chatStreamController = StreamController<List<ChatMessage>>.broadcast();

  StreamSink<List<ChatMessage>> get _liveChatController =>
      _chatStreamController.sink;

  Stream<List<ChatMessage>> get liveChats => _chatStreamController.stream;

  ChatBloc() : super(InitChatState()) {
    _repository = ChatRepository.instance;

    on<GetChatRooms>((event, emit) async {
      emit(ShowLoadingChat());
      var data = await _repository.fetchChatRooms();
      if (data.status == 200) {
        if (data.rowCount > 0) {
          emit(ShowChatRooms(data.data));
        } else {
          emit(ShowEmptyChatRoom());
        }
      } else {}
    });

    on<GetChatMessages>((event, emit) async {
      emit(ShowLoadingChat());
      var data = await _repository.fetchChatMessages(event.uuidChatRoom);
      if (data.status == 200) {
        _chats.addAll(data.data);
        _liveChatController.add(_chats);
        emit(ShowChatMessages(data.data));
      } else {}
    });

    on<OpenChatRoom>((event, emit) async {
      _delegate = event.delegate;
      _delegate.onLoading();
      var data = await _repository.initiatingChatRoom(event.uuidUser);
      if (data.status == 200) {
        _delegate.onSuccess(data.uuidChatRoom);
      } else {
        _delegate.onError(data.message);
      }
    });

    on<SendChat>((event, emit) async {
      _chats.add(
        ChatMessage(
          message: event.message,
          senderEmail: event.email,
          createdDate: DateTime.now(),
        ),
      );

      _liveChatController.add(_chats);
      var data = await _repository.sendMessage(
          event.email, event.message, event.uuidChatRoom);
      if (data.status == 201) {
        print(data.message);
      } else {
        print(data.message);
      }
    });
  }

  void dispose() {
    _chatStreamController.close();
  }
}
