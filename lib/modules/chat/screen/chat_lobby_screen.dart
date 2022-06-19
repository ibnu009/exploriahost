import 'package:exploriahost/modules/chat/bloc/chat_bloc.dart';
import 'package:exploriahost/modules/chat/bloc/chat_even.dart';
import 'package:exploriahost/modules/chat/bloc/chat_state.dart';
import 'package:exploriahost/modules/chat/widget/chat_room_item.dart';
import 'package:exploriahost/ui/component/generic/exploria_generic_empty_state_widget.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatLobbyScreen extends StatefulWidget {
  const ChatLobbyScreen({Key? key}) : super(key: key);

  @override
  _ChatLobbyScreenState createState() => _ChatLobbyScreenState();
}

class _ChatLobbyScreenState extends State<ChatLobbyScreen> {
  late ChatBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ChatBloc();
    _bloc.add(GetChatRooms());
  }

  @override
  void dispose() {
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
            child: ExploriaLoading(width: 100,),
          );
        }
        if (state is ShowChatRooms) {
          return state.chatRooms.isEmpty ?
          const Center(
            child: ExploriaGenericEmptyState(
                assets: 'assets/empty_schedule.png',
                text: "Belum ada Chat"),
          ) :
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.chatRooms.length,
              itemBuilder: (context, index) {
                return ChatRoomItem(chatRoom: state.chatRooms[index],);
              });
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
        title: Text('Chat',
            style: ExploriaTheme.bodyText.copyWith(color: Colors.white)),
        centerTitle: true,
        elevation: 4,
      ),
      body: blocListener(blocBuilder()),
    );
  }
}
