import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';

class BuildItemSchedule extends StatelessWidget {
  const BuildItemSchedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Sculpting Sulfur With Local Miners ", style: ExploriaTheme.smallTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
            const SizedBox(height: 8,),
            Text("Minggu, 8 Juni 2022 ", style: ExploriaTheme.smallTitleRed),
            const SizedBox(height: 8,),
            const Align(
                alignment: Alignment.bottomRight,
                child: Text("10 Jam lagi ", style: TextStyle(fontSize: 12))),
          ],
        ),
      ),
    );
  }
}
