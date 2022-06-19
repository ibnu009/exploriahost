import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:flutter/material.dart';

class ExploriaFieldButton extends StatelessWidget {
  final String title;
  const ExploriaFieldButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.centerLeft,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black38)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ExploriaGenericTextInputHint(text: title),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }
}
