import 'package:exploriahost/core/network/request/create_experience_request.dart';
import 'package:exploriahost/utils/generic_delegate.dart';

abstract class ExperienceEvent {}

class GetEtalaseExperience extends ExperienceEvent {
  String status;

  GetEtalaseExperience(this.status);
}

class CreateExperience extends ExperienceEvent {
  CreateExperienceRequest request;
  GenericDelegate delegate;

  CreateExperience({required this.request, required this.delegate});
}
