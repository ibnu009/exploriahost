import 'package:exploriahost/modules/mission/screen/mission_detail.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BuildNotificationItem extends StatelessWidget {
  const BuildNotificationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, CupertinoPageRoute(builder: (c) => const MissionDetailScreen()));
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
              const SizedBox(height: 8,),
              Row(
                children: [
                  Icon(
                      Icons.calendar_today_outlined,
                    size: 17.0, color: ExploriaTheme.greydark,),
                  Text('  30 May 2022', style: ExploriaTheme.bodyText.copyWith(fontSize: 12.0),)
                ],
              ),
              const SizedBox(height: 8,),
              Text(
                  "Kamu melakukan aktivitas pencairan saldo pada 1 June 2022 pada jam 12.45 sebesar Rp. 1.000.000",
                  style: ExploriaTheme.smallTitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
