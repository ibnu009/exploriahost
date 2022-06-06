import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/experience/experience_etalase_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ExperienceRepository extends NetworkService {
  ExperienceRepository();

  final storage = const FlutterSecureStorage();

  ExperienceRepository._privateConstructor();

  static final ExperienceRepository _instance = ExperienceRepository._privateConstructor();

  static ExperienceRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";
  final String token = "token";

  Future<ExperienceEtalaseResponse> getExperienceEtalase(String status) async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod(
        "$BASE_URL/api/host/experience/etalase?status=$status", header);

    return ExperienceEtalaseResponse.fromJson(map);
  }
}
