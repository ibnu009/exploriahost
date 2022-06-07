import 'package:exploriahost/core/network/response/schedule/schedule_detail_response.dart';
import 'package:exploriahost/core/network/response/schedule/schedule_item_response.dart';

abstract class ScheduleState {}

class InitScheduleState extends ScheduleState {}

class ShowLoading extends ScheduleState {}

class ShowSchedules extends ScheduleState {
  List<Schedule> schedules;

  ShowSchedules(this.schedules);
}

class ShowScheduleDetail extends ScheduleState {
  ScheduleDetail schedule;

  ShowScheduleDetail(this.schedule);
}
