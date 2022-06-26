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
      emit(ShowMissionDetail(data.message == "000"));
    });

    on<SubmitMissionSubmission>((event, emit) async {
      _delegate = event.delegate;
      _delegate.onLoading();
      var data = await _repository.submitSubmission(event.request, event.selfieImage, event.dataImage);
      if (data.status == 201 || data.status == 200){
        _delegate.onSuccess(data.message ?? "");
      } else {
        _delegate.onError(data.message ?? "");
      }
    });
  }
}