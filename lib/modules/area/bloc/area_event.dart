abstract class AreaEvent {}

class GetProvinces extends AreaEvent {
  String query;
  GetProvinces(this.query);
}

class GetCities extends AreaEvent {
  String query;
  int provinceId;
  GetCities(this.provinceId, this.query);
}