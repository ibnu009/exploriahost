import 'package:exploriahost/modules/experience/widgets/experience_item.dart';
import 'package:flutter/material.dart';

class EtalaseExperienceTab extends StatelessWidget {
  const EtalaseExperienceTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ExperienceItem();
        });
  }
}
