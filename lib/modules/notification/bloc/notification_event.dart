import 'package:exploriahost/utils/generic_delegate.dart';

abstract class NotificationEvent {}

class GetNotification extends NotificationEvent {}

class GetNotificationDetail extends NotificationEvent {
  String Notificationid;

  GetNotificationDetail(this.Notificationid);
}

// class SetVerificationStatus extends NotificationEvent {
//   String NotificationUuid, status;
//   GenericDelegate delegate;
//   SetVerificationStatus(this.NotificationUuid, this.status, this.delegate);
// }