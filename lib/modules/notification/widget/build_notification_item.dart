import 'package:exploriahost/core/network/response/notification/notification_response.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/date_time_ext.dart';
import 'package:flutter/material.dart';


class BuildNotificationItem extends StatelessWidget {
  final Notifications notification;

  const BuildNotificationItem({Key? key, required this.notification}) : super(key: key);

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
            const SizedBox(
              height: 8,
            ),
            Text(notification.createDate.convertToExploriaDateAndHour()),
            const SizedBox(
              height: 8,
            ),
            Text(notification.message,
                style: ExploriaTheme.smallTitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
