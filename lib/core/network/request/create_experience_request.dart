import 'dart:io';

class CreateExperienceRequest {
  CreateExperienceRequest(
      {this.name, this.description, this.category, this.price, this.duration, this.files, this.otherExperience, this.facilities, this.provinceId, this.cityId, this.address, this.latitude, this.longitude});

  String? name;
  String? description;
  String? category;
  int? price;
  int? duration;
  List<File>? files;
  String? otherExperience;
  String? facilities;
  int? provinceId;
  int? cityId;
  String? address;
  double? latitude;
  double? longitude;

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "price": price,
        "duration": duration,
        "category": category,
        "address": address,
        "province_id": provinceId,
        "city_id": cityId,
        "other_experiences": otherExperience,
        "facilities": facilities,
        "latitude": latitude,
        "longitude": longitude,
        "files": files
      };
}
