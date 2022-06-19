import 'package:exploriahost/modules/home/widget/build_item_schedule.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_bloc.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_event.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_state.dart';
import 'package:exploriahost/ui/component/generic/exploria_generic_empty_state_widget.dart';
import 'package:exploriahost/ui/component/generic/exploria_loading.dart';
import 'package:exploriahost/ui/theme/exploria_primary_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllScheduleScreen extends StatefulWidget {
  const AllScheduleScreen({Key? key}) : super(key: key);

  @override
  _AllScheduleScreenState createState() => _AllScheduleScreenState();
}

class _AllScheduleScreenState extends State<AllScheduleScreen> {
  late ScheduleBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ScheduleBloc();
    _bloc.add(GetSchedule());
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
        if (state is ShowSchedules) {
          return state.schedules.isEmpty
              ? const Center(
                  child: ExploriaGenericEmptyState(
                      assets: 'assets/empty_schedule.png',
                      text: "Belum ada jadwal Experience"),
                )
              : RefreshIndicator(
                  onRefresh: () async => _bloc.add(GetSchedule()),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: state.schedules.length,
                      itemBuilder: (context, index) {
                        return BuildItemSchedule(
                          schedule: state.schedules[index],
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
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: ExploriaTheme.primaryColor,
        title: const Text(
          "Semua Jadwal",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: blocListener(blocBuilder()),
      ),
    );
  }
}
