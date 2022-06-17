import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/generic_response.dart';
import 'package:exploriahost/core/network/response/schedule/schedule_detail_response.dart';
import 'package:exploriahost/core/network/response/schedule/schedule_item_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ScheduleRepository extends NetworkService {
  ScheduleRepository();

  final storage = const FlutterSecureStorage();

  ScheduleRepository._privateConstructor();

  static final ScheduleRepository _instance = ScheduleRepository
      ._privateConstructor();

  static ScheduleRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";
  final String token = "token";

  Future<ScheduleItemResponse> fetchSchedules() async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};

    var map = await getMethod("$BASE_URL/api/host/schedule", header);

    return ScheduleItemResponse.fromJson(map);
  }

  Future<ScheduleDetailResponse> fetchScheduleDetail(String uuidSchedule) async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod(
        "$BASE_URL/api/host/schedule/$uuidSchedule", header);

    return ScheduleDetailResponse.fromJson(map);
  }

  Future<GenericResponse> setVerificationStatus(String uuidSchedule, String status) async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map = await postMethodNoBody(
        "$BASE_URL/api/host/schedule/verification?uuidSchedule=$uuidSchedule&status=$status", headers: header);

    return GenericResponse.fromJson(map);
  }

}