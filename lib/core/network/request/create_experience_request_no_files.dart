class CreateExperienceNoFileRequest {
  CreateExperienceNoFileRequest(
      {this.name,
      this.description,
      this.category,
      this.price,
      this.duration,
      this.otherExperience,
      this.facilities,
      this.provinceId,
      this.cityId,
      this.address,
      this.latitude,
      this.longitude});

  String? name;
  String? description;
  String? category;
  int? price;
  int? duration;
  String? otherExperience;
  String? facilities;
  int? provinceId;
  int? cityId;
  String? address;
  double? latitude;
  double? longitude;

  Map<String, String> toJson() => {
        "name": name!,
        "description": description!,
        "price": price.toString(),
        "duration": duration.toString(),
        "category": category ?? "",
        "address": address ?? "",
        "province_id": provinceId.toString(),
        "city_id": cityId.toString(),
        "other_experience": otherExperience ?? "",
        "facilities": facilities ?? "",
        "latitude": latitude.toString(),
        "longitude": longitude.toString(),
      };
}
