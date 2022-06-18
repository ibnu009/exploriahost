class VerifyProfileRequest {
  VerifyProfileRequest(
      {this.fullName,
      this.headline,
      this.description,
      this.address,
      this.phone});

  String? fullName;
  String? headline;
  String? description;
  String? phone;
  String? address;
  String status = "2";

  Map<String, String> toJson() => {
        "full_name": fullName ?? "",
        "headline": headline ?? "",
        "description": description ?? "",
        "address": address ?? "",
        "phone": phone ?? "",
        "verified": "2"
      };
}
