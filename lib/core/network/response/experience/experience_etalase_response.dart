import 'dart:convert';

ExperienceEtalaseResponse experienceEtalaseResponseFromJson(String str) =>
    ExperienceEtalaseResponse.fromJson(json.decode(str));

String experienceEtalaseResponseToJson(ExperienceEtalaseResponse data) =>
    json.encode(data.toJson());

class ExperienceEtalaseResponse {
  ExperienceEtalaseResponse({
    required this.status,
    required this.rowCount,
    required this.message,
    required this.data,
  });

  int? status;
  int? rowCount;
  String? message;
  List<Experience>? data;

  factory ExperienceEtalaseResponse.fromJson(Map<String, dynamic> json) =>
      ExperienceEtalaseResponse(
        status: json["status"],
        rowCount: json["row_count"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Experience>.from(
                json["data"].map((x) => Experience.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "row_count": rowCount,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Experience {
  Experience({
    required this.uuidExperience,
    required this.name,
    required this.price,
    required this.duration,
    required this.accepted,
    required this.imageUrl,
  });

  String? uuidExperience;
  String? name;
  int price;
  int duration;
  int accepted;
  String? imageUrl;

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        uuidExperience: json["uuid_experience"],
        name: json["name"],
        price: json["price"],
        duration: json["duration"],
        accepted: json["accepted"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "uuid_experience": uuidExperience,
        "name": name,
        "price": price,
        "duration": duration,
        "accepted": accepted,
        "image_url": imageUrl,
      };
}
