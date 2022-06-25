import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/generic_response.dart';
import 'package:exploriahost/core/network/response/mission/mission_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MissionRepository extends NetworkService {
  MissionRepository();

  final storage = const FlutterSecureStorage();

  MissionRepository._privateConstructor();

  static final MissionRepository _instance = MissionRepository
      ._privateConstructor();

  static MissionRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";
  final String token = "token";

  Future<MissionResponse> fetchLocalMissions() async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod(
        "$BASE_URL/api/host/missions", header);

    return MissionResponse.fromJson(map);
  }

  Future<GenericResponse> checkHostContributionStatus(String uuidMission) async {
    String? readData = await storage.read(key: 'token') ?? "";
    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod(
        "$BASE_URL/api/host/mission/contribution-status/$uuidMission", header);
    return GenericResponse.fromJson(map);
  }

}