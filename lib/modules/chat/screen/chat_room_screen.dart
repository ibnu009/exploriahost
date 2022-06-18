import 'package:exploriahost/core/network/response/chat/chat_message_response.dart';
import 'package:exploriahost/core/repository/user_repository.dart';
import 'package:exploriahost/modules/chat/bloc/chat_bloc.dart';
import 'package:exploriahost/modules/chat/bloc/chat_even.dart';
import 'package:exploriahost/modules/chat/bloc/chat_state.dart';
import 'package:exploriahost/modules/chat/widget/chat_item_my.dart';
import 'package:exploriahost/modules/chat/widget/chat_item_opponent.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/component/input/exploria_chat_input.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatRoomScreen extends StatefulWidget {
  final String uuidChatRoom, name;

  const ChatRoomScreen(
      {Key? key, required this.uuidChatRoom, required this.name})
      : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _chatController = TextEditingController();
  late ChatBloc _bloc;
  late UserRepository _repository;
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    _repository = UserRepository.instance;
    _getUserEmail();

    _bloc = ChatBloc();
    _bloc.add(GetChatMessages(widget.uuidChatRoom));
  }

  Future<void> _getUserEmail() async {
    userEmail = await _repository.readSecureData('email') ?? "";
  }

  @override
  void dispose() {
    _bloc.dispose();
    _bloc.close();
    super.dispose();
  }

  Widget blocListener(Widget child) {
    return BlocListener(
      bloc: _bloc,
      listener: (ctx, state) => debugPrint("$state"),
      child: child,
    );
  }

  Widget blocBuilder() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (ctx, state) {
        if (state is ShowLoadingChat) {
          return const Center(
            child: ExploriaLoading(
              width: 100,
            ),
          );
        }
        if (state is ShowChatMessages) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: StreamBuilder(
                  stream: _bloc.liveChats,
                  initialData: state.chats,
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ChatMessage>> snapshot) {
                    debugPrint("Data is ${snapshot.data}");
                    return _buildChatList(snapshot.data ?? []);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: ExploriaChatInput(
                            controller: _chatController,
                            inputType: TextInputType.multiline)),
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: InkWell(
                          onTap: () {
                            if (_chatController.text.isEmpty) {
                              return;
                            }
                            _bloc.add(SendChat(userEmail, _chatController.text,
                                widget.uuidChatRoom));
                            _chatController.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: const Icon(
                            Icons.send,
                            size: 32,
                            color: ExploriaTheme.primaryColor,
                          )),
                    )
                  ],
                ),
              )
            ],
          );
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ExploriaTheme.primaryColor,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: Text(widget.name,
            style: ExploriaTheme.bodyText.copyWith(color: Colors.white)),
        centerTitle: true,
        elevation: 4,
      ),
      body: blocListener(blocBuilder()),
    );
  }

  Widget _buildChatList(List<ChatMessage> chats) {
    return chats.isEmpty
        ? const Center(
            child: Text("Belum ada percakapan"),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: chats.length,
            itemBuilder: (ctx, index) =>
                isMyChatMessage(chats[index].senderEmail)
                    ? ChatItemMy(chat: chats[index])
                    : ChatItemOpponent(
                        chat: chats[index],
                      ),
          );
  }

  bool isMyChatMessage(String chatEmail) {
    return chatEmail == userEmail;
  }
}
