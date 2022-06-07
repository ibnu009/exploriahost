import 'package:exploriahost/modules/home/home_screen.dart';
import 'package:exploriahost/modules/mission/widget/build_item_mission.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MissionListScreen extends StatefulWidget {
  const MissionListScreen({Key? key}) : super(key: key);

  @override
  _MissionListScreenState createState() => _MissionListScreenState();
}

class _MissionListScreenState extends State<MissionListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white24,
          title: Text(
              "Daftar Misi",
              style: ExploriaTheme.smallTitle
          ),
          leading: InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (c) => const HomeScreen()));
              },
              child: const Icon(
                Icons.arrow_back,
                color: ExploriaTheme.primaryColor,
              )),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) => BuildItemMission()),
              ),
            )
        )
    );
  }
}