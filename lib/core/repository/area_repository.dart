import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/area/city_response.dart';
import 'package:exploriahost/core/network/response/area/province_response.dart';

class AreaRepository extends NetworkService {
  AreaRepository();

  AreaRepository._privateConstructor();

  static final AreaRepository _instance = AreaRepository._privateConstructor();

  static AreaRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";

  Future<ProvinceResponse> fetchProvinces(String query) async {
    var header = {contentType: applicationJson};
    var map = await getMethod("$BASE_URL/api/provinces?query=$query", header);

    return ProvinceResponse.fromJson(map);
  }

  Future<CityResponse> fetchCities(int provinceId, String query) async {
    var header = {contentType: applicationJson};
    var map = await getMethod("$BASE_URL/api/cities?province_id=$provinceId&query=$query", header);

    return CityResponse.fromJson(map);
  }

}