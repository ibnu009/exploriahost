import 'package:exploriahost/core/repository/notification_repository.dart';
import 'package:exploriahost/modules/notification/bloc/notification_event.dart';
import 'package:exploriahost/modules/notification/bloc/notification_state.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  late NotificationRepository _repository;
  late GenericDelegate _delegate;

  NotificationBloc() : super(InitNotificationState()) {
    _repository = NotificationRepository.instance;

    on<GetNotification>((event, emit) async {
      emit(ShowLoading());
      var data = await _repository.fetchNotifications();
      if (data.status == 200) {
        emit(ShowNotifications(data.data));
      } else {}
    });

    // on<GetNotificationDetail>((event, emit) async {
    //   emit(ShowLoading());
    //   var data = await _repository.fetchNotificationDetail(event.NotificationUuid);
    //   if (data.status == 200) {
    //     emit(ShowNotificationDetail(data.data));
    //   } else {}
    // });
  }
}