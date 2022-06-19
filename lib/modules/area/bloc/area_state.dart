import 'package:exploriahost/core/network/response/area/city_response.dart';
import 'package:exploriahost/core/network/response/area/province_response.dart';

abstract class AreaState {}

class InitAreaState extends AreaState {}

class ShowLoadingArea extends AreaState {}

class ShowProvinces extends AreaState {
  List<Province> provinces;
  ShowProvinces(this.provinces);
}

class ShowCities extends AreaState {
  List<City> cities;
  ShowCities(this.cities);
}

