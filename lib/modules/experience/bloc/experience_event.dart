abstract class ExperienceEvent {}

class GetEtalaseExperience extends ExperienceEvent {
  String status;

  GetEtalaseExperience(this.status);
}
