import 'package:exploriahost/utils/generic_delegate.dart';

abstract class ScheduleEvent {}

class GetSchedule extends ScheduleEvent {}

class GetScheduleDetail extends ScheduleEvent {
  String scheduleUuid;

  GetScheduleDetail(this.scheduleUuid);
}

class SetVerificationStatus extends ScheduleEvent {
  String scheduleUuid, status;
  GenericDelegate delegate;
  SetVerificationStatus(this.scheduleUuid, this.status, this.delegate);
}
