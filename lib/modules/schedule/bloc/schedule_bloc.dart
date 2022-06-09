import 'package:exploriahost/core/repository/schedule_repository.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_event.dart';
import 'package:exploriahost/modules/schedule/bloc/schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  late ScheduleRepository _repository;

  ScheduleBloc() : super(InitScheduleState()) {
    _repository = ScheduleRepository.instance;

    on<GetSchedule>((event, emit) async {
      emit(ShowLoading());
      var data = await _repository.fetchSchedules();
      if (data.status == 200) {
        emit(ShowSchedules(data.data));
      } else {}
    });

    on<GetScheduleDetail>((event, emit) async {
      emit(ShowLoading());
      var data = await _repository.fetchScheduleDetail(event.scheduleUuid);
      if (data.status == 200) {
        emit(ShowScheduleDetail(data.data));
      } else {}
    });
  }
}
