
import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/auth/LoginResponse.dart';
import 'package:exploriahost/core/network/response/auth/RegisterResponse.dart';
import 'package:exploriahost/utils/string_ext.dart';
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
  final String applicationJson = "application/json";
  final String token = "token";

  Future<LoginResponse> submitLogin(String email, String password) async {

    String hashedPassword = password.convertToSha256();
    print('normal password is $password' );
    print('hashed password is $hashedPassword');

    var header = {contentType: applicationJson};
    var body = {
      'email': email,
      'password': hashedPassword
    };
    var map = await postMethod("$BASE_URL/api/host/login",
        body: body, headers: header);
    return LoginResponse.fromJson(map);
  }

  Future<RegisterResponse> submitRegister(String name, String email, String password) async {

    String hashedPassword = password.convertToSha256();
    print('normal password is $password' );
    print('hashed password is $hashedPassword');

    Map<String, Object> body = {
      'full_name': name,
      'email': email,
      'password': hashedPassword
    };

    var header = {contentType: applicationJson};
    var map = await postMethod("$BASE_URL/api/host/register",
        body: body, headers: header);
    return RegisterResponse.fromJson(map);
  }

  Future<String?> readSecureData(String key) {
    var readData = storage.read(key: key);
    return readData;
  }

  Object writeSecureTokenData( String value) {
    var writeData = storage.write(key: 'token', value: value);
    return writeData;
  }

}