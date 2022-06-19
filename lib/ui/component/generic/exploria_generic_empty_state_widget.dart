import 'package:flutter/material.dart';

class ExploriaGenericEmptyState extends StatelessWidget {
  final String assets, text;
  const ExploriaGenericEmptyState({Key? key, required this.assets, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(assets),
        const SizedBox(height: 12,),
        Text(text),
      ],
    );
  }
}
