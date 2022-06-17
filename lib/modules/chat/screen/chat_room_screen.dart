import 'package:exploriahost/modules/chat/widget/chat_item_my.dart';
import 'package:exploriahost/modules/chat/widget/chat_item_opponent.dart';
import 'package:exploriahost/ui/component/input/exploria_chat_input.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({Key? key}) : super(key: key);

  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final TextEditingController _chatController = TextEditingController();

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
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: _buildChatList()),
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
                  child: InkWell(onTap: () {}, child: const Icon(Icons.send, size: 32, color: ExploriaTheme.primaryColor,)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (ctx, index) =>
            index % 2 == 0 ? ChatItemOpponent() : ChatItemMy());
  }
}
