import 'package:exploriahost/modules/mission/bloc/mission_bloc.dart';
import 'package:exploriahost/modules/mission/bloc/mission_event.dart';
import 'package:exploriahost/modules/mission/bloc/mission_state.dart';
import 'package:exploriahost/modules/mission/widget/build_item_mission.dart';
import 'package:exploriahost/ui/component/generic/exploria_generic_empty_state_widget.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/component/generic/generic_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionListScreen extends StatefulWidget {
  const MissionListScreen({Key? key}) : super(key: key);

  @override
  _MissionListScreenState createState() => _MissionListScreenState();
}

class _MissionListScreenState extends State<MissionListScreen> {
  late MissionBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = MissionBloc();
    _bloc.add(GetLocalMissions());
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
        if (state is ShowLoadingMission) {
          return const Center(
            child: ExploriaLoading(
              width: 100,
            ),
          );
        }
        if (state is ShowEmptyMissions) {
          return const Center(
            child: ExploriaGenericEmptyState(
                assets: 'assets/empty_schedule.png',
                text:
                    "Belum ada Mission yang tersedia, check kembali nanti ya"),
          );
        }
        if (state is ShowLocalMissions) {
          return RefreshIndicator(
            onRefresh: () async => _bloc.add(GetLocalMissions()),
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.missions.length,
                itemBuilder: (context, index) {
                  return BuildItemMission(
                    mission: state.missions[index],
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
        appBar: genericAppbar(context, "Daftar Misi"),
        body: SafeArea(child: blocListener(blocBuilder())));
  }
}