import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class ExploriaGenericTextInputHint extends StatelessWidget {
  final String text;
  const ExploriaGenericTextInputHint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 15, 4),
      child: Text(
        text,
        style: ExploriaTheme.smallTitle
      ),
    );
  }
}
