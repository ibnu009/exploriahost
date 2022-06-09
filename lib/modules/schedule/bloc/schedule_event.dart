abstract class ScheduleEvent {}

class GetSchedule extends ScheduleEvent{}

class GetScheduleDetail extends ScheduleEvent{
  String scheduleUuid;
  GetScheduleDetail(this.scheduleUuid);
}