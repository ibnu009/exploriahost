import 'dart:io';

class SubmitSubmissionRequest {
  SubmitSubmissionRequest({
    required this.name,
    required this.description,
    required this.address,
    required this.uuidMission,
    required this.latitude,
    required this.longitude
  });

  String name;
  String description;
  String address;
  String uuidMission;
  double latitude;
  double longitude;

  Map<String, String> toJson() => {
    "data_name": name,
    "data_description": description,
    "data_address": address,
    "uuid_mission": uuidMission,
    "latitude": latitude.toString(),
    "longitude": longitude.toString(),
  };
}