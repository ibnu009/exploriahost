import 'package:exploriahost/modules/home/widget/BuildBannerList.dart';
import 'package:exploriahost/modules/home/widget/build_home_menu.dart';
import 'package:exploriahost/modules/home/widget/build_item_schedule.dart';
import 'package:exploriahost/modules/profile/screen/profile_screen.dart';
import 'package:exploriahost/modules/schedule/screens/all_schedule_screen.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildHomeHeader(),
              const SizedBox(
                height: 18,
              ),
              BuildBannerList(),
              const SizedBox(
                height: 18,
              ),
              BuildHomeMenu(),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jadwal Terdekat", style: ExploriaTheme.subTitle),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (c) => const AllScheduleScreen()));
                        },
                        child:
                            Text("Semua", style: ExploriaTheme.subTitleButton)),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              // ListView.builder(
              //     itemCount: 4,
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemBuilder: (ctx, index) => BuildItemSchedule()),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildHomeHeader extends StatelessWidget {
  const BuildHomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                CupertinoPageRoute(builder: (c) => const ProfileScreen(),),);
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_640/v1578620671/wwa6sd5wyp1wxjrder5i.png"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ibnu Batutah", style: ExploriaTheme.subTitle),
                Text("0 pts", style: TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
            child: Icon(Icons.notifications_active,
                color: ExploriaTheme.primaryColor),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: Icon(
              Icons.chat,
              color: ExploriaTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
