import 'package:exploriahost/modules/chat/widget/chat_room_item.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class ChatLobbyScreen extends StatefulWidget {
  const ChatLobbyScreen({Key? key}) : super(key: key);

  @override
  _ChatLobbyScreenState createState() => _ChatLobbyScreenState();
}

class _ChatLobbyScreenState extends State<ChatLobbyScreen> {
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
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return ChatRoomItem();
          }),
    );
  }
}
