import 'package:exploriahost/core/network/response/schedule/schedule_item_response.dart';
import 'package:exploriahost/modules/schedule/screens/detail_schedule_screen.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/int_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildItemSchedule extends StatelessWidget {
  final Schedule schedule;

  const BuildItemSchedule({Key? key, required this.schedule}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (c) =>
                DetailScheduleScreen(uuidSchedule: schedule.uuidHostSchedule),
          ),
        );
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
              Text(schedule.name,
                  style: ExploriaTheme.smallTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(
                height: 8,
              ),
              Text(schedule.startDate.convertMilliSecondsToDate(),
                  style: ExploriaTheme.smallTitleRed),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  schedule.startDate.getDueDateFromMilli(),
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
