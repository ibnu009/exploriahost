import 'package:exploriahost/core/network/request/create_experience_request.dart';

abstract class ExperienceEvent {}

class GetEtalaseExperience extends ExperienceEvent {
  String status;

  GetEtalaseExperience(this.status);
}

class CreateExperience extends ExperienceEvent {
  CreateExperienceRequest request;

  CreateExperience({required this.request});
}
