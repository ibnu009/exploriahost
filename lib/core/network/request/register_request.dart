import 'dart:convert';

RegisterRequest registerFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  String name;
  String email;
  String phoneNumber;
  String password;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    phoneNumber: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "phone_number": phoneNumber,
  };
}
