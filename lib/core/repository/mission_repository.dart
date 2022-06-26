import 'dart:convert';
import 'dart:io';

import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/request/submit_submission_request.dart';
import 'package:exploriahost/core/network/response/generic_response.dart';
import 'package:exploriahost/core/network/response/mission/mission_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class MissionRepository extends NetworkService {
  MissionRepository();

  final storage = const FlutterSecureStorage();

  MissionRepository._privateConstructor();

  static final MissionRepository _instance =
      MissionRepository._privateConstructor();

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

  Future<GenericResponse> checkHostContributionStatus(
      String uuidMission) async {
    String? readData = await storage.read(key: 'token') ?? "";
    var header = {contentType: applicationJson, token: readData};
    var map = await getMethod(
        "$BASE_URL/api/host/mission/contribution-status/$uuidMission", header);
    return GenericResponse.fromJson(map);
  }

  Future<GenericResponse> submitSubmission(
      SubmitSubmissionRequest req, File selfieImage, File imageData) async {
    String? readData = await storage.read(key: 'token') ?? "";
    var header = {contentType: applicationJson, token: readData};

    var uri = Uri.parse("$BASE_URL/api/host/mission/send-submission");
    var request = http.MultipartRequest("POST", uri);

    request.files.add(await http.MultipartFile.fromPath(
        'image_selfie', selfieImage.path,
        contentType: MediaType('image', '*')));

    request.files.add(await http.MultipartFile.fromPath(
        'image_data', imageData.path,
        contentType: MediaType('image', '*')));

    request.headers.addAll(header);
    request.fields.addAll(req.toJson());

    var response = await request.send().then(http.Response.fromStream);
    var res = jsonDecode(response.body);
    logger.d(res);

    return GenericResponse.fromJson(res);
  }
}