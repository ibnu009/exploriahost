import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/ui/component/button/primary_button.dart';
import 'package:exploriahost/ui/component/image/exploria_image_network.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class BuildUserCard extends StatelessWidget {
  final String image, name, uuidUser;
  final Function() onTapChat;

  const BuildUserCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.uuidUser, required this.onTapChat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(top: 0, left: 12, right: 12),
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
              child: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                  image.isEmpty ? defaultImage : '$BASE_URL$image',
                ),
              ),
            ),
            Text(
              name,
              style: ExploriaTheme.title.copyWith(fontSize: 18),
              maxLines: 1,
            ),
            const Spacer(),
            exploriaPrimaryButtonResizeable(
                context: context,
                text: 'Chat',
                isEnabled: true,
                onPressed: onTapChat,
                minimumWidth: 100,
                minimumHeight: 40)
          ],
        ),
      ),
    );
  }
}
