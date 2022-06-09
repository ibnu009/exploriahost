import 'package:exploriahost/core/network/response/experience/experience_detail_response.dart';
import 'package:exploriahost/core/network/response/experience/experience_etalase_response.dart';

abstract class ExperienceState {}

class InitExperienceState extends ExperienceState {}

class ShowLoading extends ExperienceState {}

class ShowLoadingExperience extends ExperienceState {}

class ShowDetailExperience extends ExperienceState {
  DetailExperience experience;
  ShowDetailExperience(this.experience);
}


class ShowEtalaseExperience extends ExperienceState {
  List<Experience> experiences;
  ShowEtalaseExperience(this.experiences);
}
