import 'package:exploriahost/modules/home/home_screen.dart';
import 'package:exploriahost/modules/notification/bloc/notification_bloc.dart';
import 'package:exploriahost/modules/notification/bloc/notification_event.dart';
import 'package:exploriahost/modules/notification/widget/build_notification_item.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/notification_state.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = NotificationBloc();
    _bloc.add(GetNotification());
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
        if (state is ShowLoading) {
          return const Center(
            child: ExploriaLoading(width: 100,),
          );
        }
        if (state is ShowNotifications) {
          return RefreshIndicator(
            onRefresh: () async => _bloc.add(GetNotification()),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.notifications.length,
                itemBuilder: (context, index) {
                  return BuildNotificationItem(
                      notification: state.notifications[index]
                  );
                }),
          );
        }
        return const SizedBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: ExploriaTheme.primaryColor,
          title: Text("Notifikasi", style: ExploriaTheme.smallTitle.copyWith(color: Colors.white)),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: blocListener(blocBuilder()),
        )
    );
  }
}