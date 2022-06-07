import 'package:exploriahost/ui/component/text/exploria_generic_text_input_hint.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingNotification extends StatefulWidget {
  const SettingNotification({Key? key}) : super(key: key);

  @override
  _SettingNotificationState createState() => _SettingNotificationState();
}

class _SettingNotificationState extends State<SettingNotification> {
  bool isSwitched_verification_experience = true;
  bool isSwitched_ordered_experience = true;
  bool isSwitched_experience_schedule = true;
  bool isSwitched_finished_experience = true;
  bool isSwitched_added_mission = false;
  bool isSwitched_mission_success = true;
  bool isSwitched_points_exchanged = false;
  bool isSwitched_new_chat = true;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white24,
        title: Text( 'Pengaturan Notifikasi',
            style: ExploriaTheme.smallTitle
        ),
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: ExploriaTheme.primaryColor,
            )
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20.0,),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Experience Terverifikasi', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_verification_experience,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_verification_experience = value;
                            print(isSwitched_verification_experience);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Experience Dipesan', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_ordered_experience,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_ordered_experience = value;
                            print(isSwitched_ordered_experience);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Jadwal Experience', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_experience_schedule,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_experience_schedule = value;
                            print(isSwitched_experience_schedule);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Experience Selesai', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_finished_experience,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_finished_experience = value;
                            print(isSwitched_finished_experience);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Misi Ditambahkan', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_added_mission,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_added_mission = value;
                            print(isSwitched_added_mission);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Misi Berhasil', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_mission_success,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_mission_success = value;
                            print(isSwitched_mission_success);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Point Ditukar', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_points_exchanged,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_points_exchanged = value;
                            print(isSwitched_points_exchanged);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children : [
                      Text('Chat Baru', style: ExploriaTheme.smallTitle.copyWith(fontSize: 15),),
                      Switch(
                        value: isSwitched_new_chat,
                        onChanged: (value) {
                          setState(() {
                            isSwitched_new_chat = value;
                            print(isSwitched_new_chat);
                          });
                        },
                        activeTrackColor: ExploriaTheme.primaryColorBrighter,
                        activeColor: ExploriaTheme.primaryColor,
                      )
                    ]
                ),
              ),
              _buildDivider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(color: Colors.black12, thickness: 1),
    );
  }
}

