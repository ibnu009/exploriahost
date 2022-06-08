import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/generic_response.dart';
import 'package:exploriahost/core/network/response/home/home_content_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeRepository extends NetworkService {
  HomeRepository();

  final storage = const FlutterSecureStorage();

  HomeRepository._privateConstructor();

  static final HomeRepository _instance = HomeRepository._privateConstructor();

  static HomeRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";
  final String token = "token";

  Future<GenericResponse> sendFirebaseToken(String firebaseToken) async {
    String? readData = await storage.read(key: 'token') ?? "";
    var header = {contentType: applicationJson, token: readData};
    var map = await postMethodNoBody("$BASE_URL/api/host/set-notification-token?fireToken=$firebaseToken",
        headers: header);
    return GenericResponse.fromJson(map);
  }

  Future<HomeContentResponse> fetchHostHomeContent() async {
    String? readData = await storage.read(key: 'token') ?? "";
    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod("$BASE_URL/api/host/home-content", header);
    return HomeContentResponse.fromJson(map);
  }
}