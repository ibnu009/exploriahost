abstract class MissionEvent {}

class GetLocalMissions extends MissionEvent {}

class CheckHostContributionStatus extends MissionEvent {
  String uuidMission;
  CheckHostContributionStatus(this.uuidMission);
}