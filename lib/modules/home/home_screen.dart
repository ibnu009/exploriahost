import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/home/home_content_response.dart';
import 'package:exploriahost/core/network/response/profile/host_profile.dart';
import 'package:exploriahost/modules/home/bloc/home_bloc.dart';
import 'package:exploriahost/modules/home/bloc/home_event.dart';
import 'package:exploriahost/modules/home/bloc/home_state.dart';
import 'package:exploriahost/modules/home/widget/BuildBannerList.dart';
import 'package:exploriahost/modules/home/widget/build_home_menu.dart';
import 'package:exploriahost/modules/home/widget/build_item_schedule.dart';
import 'package:exploriahost/modules/notification/notification_screen.dart';
import 'package:exploriahost/modules/profile/screen/profile_screen.dart';
import 'package:exploriahost/modules/schedule/screens/all_schedule_screen.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:exploriahost/utils/int_ext.dart';
import 'package:exploriahost/utils/notification_firebase.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../ui/component/image/exploria_image_network.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;
  final FirebaseMessaging message = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _bloc = HomeBloc();
    _bloc.add(GetHomeContent());
    _bloc.add(SendFirebaseToken());

    initiateIosPermission();
    FirebaseMessaging.onMessage.listen((event) {
      showNotification(event, flutterLocalNotificationsPlugin);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      showNotification(event, flutterLocalNotificationsPlugin);
    });
    FirebaseMessaging.onBackgroundMessage((message) =>
        showNotification(message, flutterLocalNotificationsPlugin));
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print(message.messageType);
      }
    });
    initNotificationSetting();
  }

  Widget blocListener(Widget child) {
    return BlocListener(
      bloc: _bloc,
      listener: (ctx, state) => print("$state"),
      child: child,
    );
  }

  Widget blocBuilder() {
    return BlocBuilder(
      bloc: _bloc,
      builder: (ctx, state) {
        if (state is ShowHomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ShowHomeContent) {
          return _buildHomeBody(state.homeContent);
        }
        return Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(child: blocListener(blocBuilder())),
      ),
    );
  }

  Widget _buildHomeBody(HomeContent homeContent) {
    HostProfile profile = homeContent.hostProfile;
    return Column(
      children: [
        BuildHomeHeader(
          balance: profile.balance,
          profileImage: profile.imageUrl,
          profileName: profile.fullName,
        ),
        const SizedBox(
          height: 18,
        ),
        const BuildBannerList(),
        const SizedBox(
          height: 18,
        ),
        const BuildHomeMenu(),
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
                  child: Text("Semua", style: ExploriaTheme.subTitleButton)),
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        ListView.builder(
            itemCount: homeContent.schedules.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) =>
                BuildItemSchedule(schedule: homeContent.schedules[index])),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }

  void initiateIosPermission() async {
    NotificationSettings setting =
        await message.requestPermission(alert: true, badge: true, sound: true);
    if (setting.authorizationStatus == AuthorizationStatus.authorized) {
      ('diizinkan');
    } else if (setting.authorizationStatus == AuthorizationStatus.provisional) {
      ('diizinkan');
    } else {
      ('tidak diizinkan');
    }

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }

  void initNotificationSetting() {
    var initsettingAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    const IOSInitializationSettings initIos = IOSInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false);

    final InitializationSettings initSetting =
        InitializationSettings(android: initsettingAndroid, iOS: initIos);

    flutterLocalNotificationsPlugin.initialize(initSetting,
        onSelectNotification: onSelectNotification);
  }

  Future<dynamic> onSelectNotification(payload) async {
    Navigator.pushNamed(context, payload);
  }
}

class BuildHomeHeader extends StatelessWidget {
  final String profileImage, profileName;
  final int balance;

  const BuildHomeHeader(
      {Key? key,
      required this.profileImage,
      required this.profileName,
      required this.balance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (c) => const ProfileScreen(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    profileImage.isEmpty ? defaultImage : '$BASE_URL$profileImage'),
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
                Text(profileName, style: ExploriaTheme.subTitle),
                Text(balance.toRupiah(), style: const TextStyle(fontSize: 13)),
              ],
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (c) => const NotificationScreen()));
            },
            child: const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
              child: Icon(Icons.notifications_active,
                  color: ExploriaTheme.primaryColor),
            ),
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
