import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/request/create_experience_request.dart';
import 'package:exploriahost/core/network/request/create_experience_request_no_files.dart';
import 'package:exploriahost/core/network/response/experience/experience_etalase_response.dart';
import 'package:exploriahost/core/network/response/generic_response.dart';
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

  Future<GenericResponse> createExperience(
      CreateExperienceRequest request) async {
    String? readData = await storage.read(key: 'token') ?? "";

    CreateExperienceNoFileRequest newRequest = CreateExperienceNoFileRequest(
        name: request.name,
        description: request.description,
        price: request.price,
        category: request.category,
        duration: request.duration,
        facilities: request.facilities,
        otherExperience: request.otherExperience,
        address: request.address,
        provinceId: request.provinceId,
        cityId: request.cityId,
        longitude: request.longitude,
        latitude: request.latitude);

    var header = {contentType: applicationJson, token: readData};
    var map = await createExperienceService(
        "$BASE_URL/api/host/experience/create",
        body: newRequest.toJson(),
        files: request.files!,
        header: header);

    return GenericResponse.fromJson(map);
  }
}
