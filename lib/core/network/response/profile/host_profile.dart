class HostProfile {
  HostProfile({
    required this.id,
    required this.uuidHost,
    required this.fullName,
    required this.headline,
    required this.description,
    required this.imageUrl,
    required this.email,
    required this.phone,
    required this.password,
    required this.address,
    required this.point,
    required this.balance,
    required this.verified,
    required this.verifiedDate,
  });

  int id;
  String uuidHost;
  String fullName;
  String headline;
  String description;
  String imageUrl;
  String email;
  String phone;
  String password;
  String address;
  int point;
  int balance;
  int verified;
  DateTime? verifiedDate;

  factory HostProfile.fromJson(Map<String, dynamic> json) => HostProfile(
    id: json["id"] == null ? null : json["id"],
    uuidHost: json["uuid_host"] == null ? null : json["uuid_host"],
    fullName: json["full_name"] == null ? null : json["full_name"],
    headline: json["headline"] == null ? null : json["headline"],
    description: json["description"] == null ? null : json["description"],
    imageUrl: json["image_url"] == null ? null : json["image_url"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    password: json["password"] == null ? null : json["password"],
    address: json["address"] == null ? null : json["address"],
    point: json["point"] == null ? null : json["point"],
    balance: json["balance"] == null ? null : json["balance"],
    verified: json["verified"] == null ? null : json["verified"],
    verifiedDate: json["verified_date"] == null ? null : DateTime.parse(json["verified_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "uuid_host": uuidHost == null ? null : uuidHost,
    "full_name": fullName == null ? null : fullName,
    "headline": headline == null ? null : headline,
    "description": description == null ? null : description,
    "image_url": imageUrl == null ? null : imageUrl,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "password": password == null ? null : password,
    "address": address == null ? null : address,
    "point": point == null ? null : point,
    "balance": balance == null ? null : balance,
    "verified" : verified,
    "verified_date": verifiedDate,
  };
}
