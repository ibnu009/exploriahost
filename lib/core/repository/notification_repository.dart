import 'package:exploriahost/core/network/network_service.dart';
import 'package:exploriahost/core/network/response/generic_response.dart';
import 'package:exploriahost/core/network/response/notification/notification_response.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NotificationRepository extends NetworkService {
  NotificationRepository();

  final storage = const FlutterSecureStorage();

  NotificationRepository._privateConstructor();

  static final NotificationRepository _instance = NotificationRepository
      ._privateConstructor();

  static NotificationRepository get instance => _instance;

  Map<String, String> header = {};
  final String contentType = "Content-Type";
  final String applicationJson = "application/json";
  final String token = "token";

  Future<NotificationResponse> fetchNotifications() async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};

    var map = await getMethod("$BASE_URL/api/host/Notification", header);

    return NotificationResponse.fromJson(map);
  }

  // Future<NotificationDetailResponse> fetchNotificationDetail(String uuidNotification) async {
  //   String? readData = await storage.read(key: 'token') ?? "";
  //
  //   var header = {contentType: applicationJson, token: readData};
  //   var map = await getMethod(
  //       "$BASE_URL/api/host/Notification/$uuidNotification", header);
  //
  //   return NotificationDetailResponse.fromJson(map);
  // }

  Future<GenericResponse> setVerificationStatus(String uuidNotification, String status) async {
    String? readData = await storage.read(key: 'token') ?? "";

    var header = {contentType: applicationJson, token: readData};
    var map = await postMethodNoBody(
        "$BASE_URL/api/host/Notification/verification?uuidNotification=$uuidNotification&status=$status", headers: header);

    return GenericResponse.fromJson(map);
  }

}