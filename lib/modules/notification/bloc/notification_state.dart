import 'package:exploriahost/core/network/response/notification/notification_response.dart';

abstract class NotificationState {}

class InitNotificationState extends NotificationState {}

class ShowLoading extends NotificationState {}

class ShowNotifications extends NotificationState {
  List<Notifications> notifications;

  ShowNotifications(this.notifications);
}

// class ShowNotificationDetail extends NotificationState {
//   NotificationDetail Notification;
//
//   ShowNotificationDetail(this.Notification);
// }