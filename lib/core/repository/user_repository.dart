
import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/auth/LoginResponse.dart';
import 'package:exploriahost/core/network/response/auth/RegisterResponse.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserRepository extends NetworkService {
  UserRepository();
  final storage = const FlutterSecureStorage();

  UserRepository._privateConstructor();

  static final UserRepository _instance = UserRepository
      ._privateConstructor();

  static UserRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json; charset=UTF-8";
  final String token = "token";

  Future<LoginResponse> submitLogin(String email, String password) async {
    var header = {contentType: applicationJson};
    var body = {
      'email': email,
      'password': password
    };
    var map = await postMethod("$BASE_URL/api/login",
        body: body, headers: header);
    return LoginResponse.fromJson(map);
  }

  Future<RegisterResponse> submitRegister(Map<String, Object> body) async {
    var header = {contentType: applicationJson};
    var map = await postMethod("$BASE_URL/api/register",
        body: body, headers: header);
    return RegisterResponse.fromJson(map);
  }

  Object readSecureData(String key) {
    var readData = storage.read(key: key);
    return readData;
  }

  Object readProfileData(String key) {
    var readData = storage.read(key: key);
    return readData;
  }

  Object writeSecureTokenData( String value) {
    var writeData = storage.write(key: 'token', value: value);
    return writeData;
  }

}