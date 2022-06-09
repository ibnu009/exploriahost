import 'dart:convert';

DetailExperienceResponse detailExperienceResponseFromJson(String str) =>
    DetailExperienceResponse.fromJson(json.decode(str));

String detailExperienceResponseToJson(DetailExperienceResponse data) =>
    json.encode(data.toJson());

class DetailExperienceResponse {
  DetailExperienceResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int status;
  int rowCount;
  String message;
  DetailExperience data;

  factory DetailExperienceResponse.fromJson(Map<String, dynamic> json) =>
      DetailExperienceResponse(
        status: json["status"] == null ? null : json["status"],
        rowCount: json["row_count"] == null ? null : json["row_count"],
        message: json["message"] == null ? null : json["message"],
        data: DetailExperience.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "row_count": rowCount == null ? null : rowCount,
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
      };
}

class DetailExperience {
  DetailExperience({
    required this.uuidExperience,
    required this.name,
    required this.price,
    required this.duration,
    required this.otherExperiences,
    required this.facilities,
    required this.provinceId,
    required this.cityId,
    required this.ratingAvg,
    required this.ratingCount,
    required this.latitude,
    required this.longitude,
    required this.accepted,
    required this.images,
  });

  String uuidExperience;
  String name;
  int price;
  int duration;
  String otherExperiences;
  String facilities;
  int provinceId;
  int cityId;
  int ratingAvg;
  int ratingCount;
  double latitude;
  double longitude;
  int accepted;
  List<String> images;

  factory DetailExperience.fromJson(Map<String, dynamic> json) =>
      DetailExperience(
        uuidExperience:
            json["uuid_experience"] == null ? null : json["uuid_experience"],
        name: json["name"] == null ? null : json["name"],
        price: json["price"] == null ? null : json["price"],
        duration: json["duration"] == null ? null : json["duration"],
        otherExperiences: json["other_experiences"] == null
            ? null
            : json["other_experiences"],
        facilities: json["facilities"] == null ? null : json["facilities"],
        provinceId: json["province_id"] == null ? null : json["province_id"],
        cityId: json["city_id"] == null ? null : json["city_id"],
        ratingAvg: json["rating_avg"] == null ? null : json["rating_avg"],
        ratingCount: json["rating_count"] == null ? null : json["rating_count"],
        latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        accepted: json["accepted"] == null ? null : json["accepted"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "uuid_experience": uuidExperience == null ? null : uuidExperience,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "duration": duration == null ? null : duration,
        "other_experiences": otherExperiences == null ? null : otherExperiences,
        "facilities": facilities == null ? null : facilities,
        "province_id": provinceId == null ? null : provinceId,
        "city_id": cityId == null ? null : cityId,
        "rating_avg": ratingAvg == null ? null : ratingAvg,
        "rating_count": ratingCount == null ? null : ratingCount,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "accepted": accepted == null ? null : accepted,
        "images":
            images == null ? null : List<dynamic>.from(images.map((x) => x)),
      };
}
