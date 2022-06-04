import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class OtherExperienceItem extends StatelessWidget {
  final String text;
  final Function()? onTapDelete;
  final int sequence;
  const OtherExperienceItem({Key? key, required this.text, this.onTapDelete, required this.sequence}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadiusDirectional.circular(8),
          border: Border.all(color: ExploriaTheme.primaryColor)
      ),
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Center(
        child: Row(
          children: [
            Text(
              '$sequence',
              style: const TextStyle(fontSize: 12, color: Colors.black38),
            ),
            const SizedBox(width: 8,),
            Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const Spacer(),
            InkWell(
                onTap: onTapDelete,
                child: const Icon(Icons.delete, color: Colors.red,))
          ],
        ),
      ),
    );
  }
}
