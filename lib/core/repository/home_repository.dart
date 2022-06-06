import 'package:exploriahost/core/network/network_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class HomeRepository extends NetworkService {
  HomeRepository();

  final storage = const FlutterSecureStorage();

  HomeRepository._privateConstructor();

  static final HomeRepository _instance = HomeRepository
      ._privateConstructor();

  static HomeRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";
  final String token = "token";

}