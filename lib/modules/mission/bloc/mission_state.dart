import 'package:exploriahost/core/network/response/mission/mission_response.dart';

abstract class MissionState {}

class InitMissionState extends MissionState {}

class ShowLoadingMission extends MissionState {}

class ShowLocalMissions extends MissionState {
  List<Mission> missions;
  ShowLocalMissions(this.missions);
}

class ShowEmptyMissions extends MissionState {}


class ShowMissionDetail extends MissionState {
  bool isAlreadyContributed;
  ShowMissionDetail(this.isAlreadyContributed);
}