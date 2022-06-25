import 'package:exploriahost/core/repository/mission_repository.dart';
import 'package:exploriahost/modules/mission/bloc/mission_event.dart';
import 'package:exploriahost/modules/mission/bloc/mission_state.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MissionBloc extends Bloc<MissionEvent, MissionState> {
  late MissionRepository _repository;
  late GenericDelegate _delegate;

  MissionBloc() : super(InitMissionState()) {
    _repository = MissionRepository.instance;

    on<GetLocalMissions>((event, emit) async {
      emit(ShowLoadingMission());
      var data = await _repository.fetchLocalMissions();
      if (data.status == 200) {
        if (data.data.isEmpty){
          emit(ShowEmptyMissions());
          return;
        }
        emit(ShowLocalMissions(data.data));
      } else {}
    });

    on<CheckHostContributionStatus>((event, emit) async {
      emit(ShowLoadingMission());
      var data = await _repository.checkHostContributionStatus(event.uuidMission);
      emit(ShowMissionDetail((data.message ?? "") == "001"));
    });
  }
}