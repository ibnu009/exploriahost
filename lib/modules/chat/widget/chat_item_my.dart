import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItemMy extends StatelessWidget {
  const ChatItemMy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 4),
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                color: ExploriaTheme.primaryColor,
                borderRadius: BorderRadiusDirectional.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text("hahahahaha aku ngakak", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text("18:00", style: TextStyle(color: Colors.black54, fontSize: 12)),
        )
      ],
    );
  }
}
