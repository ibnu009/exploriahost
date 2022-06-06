import 'package:exploriahost/core/network/response/experience/experience_etalase_response.dart';

abstract class ExperienceState {}

class InitExperienceState extends ExperienceState {}

class ShowLoading extends ExperienceState {}

class ShowEtalaseExperience extends ExperienceState {
  List<Experience> experiences;
  ShowEtalaseExperience(this.experiences);
}
