import 'package:exploriahost/core/repository/chat_repository.dart';
import 'package:exploriahost/modules/chat/bloc/chat_even.dart';
import 'package:exploriahost/modules/chat/bloc/chat_state.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  late ChatRepository _repository;
  late GenericDelegate _delegate;

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
      print("Chat Room is ${event.uuidChatRoom}");
      var data = await _repository.fetchChatMessages(event.uuidChatRoom);
      if (data.status == 200) {
        if (data.rowCount > 0) {
          emit(ShowChatMessages(data.data));
        } else {
          emit(ShowEmptyChatMessages());
        }
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
      var data = await _repository.sendMessage(
          event.email, event.message, event.uuidChatRoom);
      if (data.status == 201) {
        print(data.message);
      } else {
        print(data.message);
      }
    });
  }
}
