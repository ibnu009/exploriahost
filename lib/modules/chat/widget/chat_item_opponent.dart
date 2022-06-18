import 'package:exploriahost/core/network/response/chat/chat_message_response.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/date_time_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItemOpponent extends StatelessWidget {
  final ChatMessage chat;
  const ChatItemOpponent({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                  color: ExploriaTheme.lightGrey,
                  borderRadius: BorderRadiusDirectional.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(chat.message, style: const TextStyle(color: Colors.black87)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(chat.createdDate.convertToHourAndMinute(), style: const TextStyle(color: Colors.black54, fontSize: 12)),
        )
      ],
    );
  }
}
