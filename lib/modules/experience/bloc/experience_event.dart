import 'package:exploriahost/core/network/request/create_experience_request.dart';
import 'package:exploriahost/utils/generic_delegate.dart';

abstract class ExperienceEvent {}

class GetEtalaseExperience extends ExperienceEvent {
  String status;

  GetEtalaseExperience(this.status);
}

class GetDetailExperience extends ExperienceEvent {
  String uuidExperience;

  GetDetailExperience(this.uuidExperience);
}

class DeleteExperience extends ExperienceEvent {
  String uuidExperience;
  GenericDelegate delegate;

  DeleteExperience(this.uuidExperience, this.delegate);
}

class CreateExperience extends ExperienceEvent {
  CreateExperienceRequest request;
  GenericDelegate delegate;

  CreateExperience({required this.request, required this.delegate});
}
