import 'dart:io';

import 'package:exploriahost/core/network/request/submit_submission_request.dart';
import 'package:exploriahost/utils/generic_delegate.dart';

abstract class MissionEvent {}

class GetLocalMissions extends MissionEvent {}

class CheckHostContributionStatus extends MissionEvent {
  String uuidMission;
  CheckHostContributionStatus(this.uuidMission);
}

class SubmitMissionSubmission extends MissionEvent {
  SubmitSubmissionRequest request;
  GenericDelegate delegate;
  File selfieImage, dataImage;
  SubmitMissionSubmission(this.request, this.delegate, this.selfieImage, this.dataImage);
}