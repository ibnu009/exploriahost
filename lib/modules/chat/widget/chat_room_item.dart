import 'package:exploriahost/core/network/response/chat/chat_room_response.dart';
import 'package:exploriahost/modules/chat/screen/chat_room_screen.dart';
import 'package:exploriahost/modules/experience/widgets/experience_item.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomItem extends StatelessWidget {
  final ChatRoom chatRoom;

  const ChatRoomItem({Key? key, required this.chatRoom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (c) => ChatRoomScreen(
                uuidChatRoom: chatRoom.uuidChatRoom, name: chatRoom.name),
          ),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(top: 1),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ExploriaImageNetwork(
                    imageUrl:
                        chatRoom.imageUrl.isEmpty ? imageP : chatRoom.imageUrl,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      chatRoom.name,
                      style: const TextStyle(
                          color: ExploriaTheme.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(chatRoom.lastMessage,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 16, overflow: TextOverflow.ellipsis)),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}