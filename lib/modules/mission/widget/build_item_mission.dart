import 'package:exploriahost/core/network/response/mission/mission_response.dart';
import 'package:exploriahost/modules/mission/screen/mission_detail.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/date_time_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildItemMission extends StatelessWidget {
  final Mission mission;
  const BuildItemMission({Key? key, required this.mission}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (c) => MissionDetailScreen(mission: mission)));
      },
      child: Card(
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
              Text(mission.name, style: ExploriaTheme.smallTitle, maxLines: 3, overflow: TextOverflow.ellipsis),
              const SizedBox(height: 8,),
              Text("${mission.point} pts ", style: ExploriaTheme.priceTextStyle),
              const SizedBox(height: 8,),
              Text("Deadline : ${mission.deadline.convertToExploriaDateAndHour()}", style: ExploriaTheme.smallTitleRed.copyWith(fontWeight: FontWeight.w300)),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
