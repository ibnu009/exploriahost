import 'package:exploriahost/core/repository/experience_repository.dart';
import 'package:exploriahost/modules/experience/bloc/experience_event.dart';
import 'package:exploriahost/modules/experience/bloc/experience_state.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  late ExperienceRepository _repository;
  late GenericDelegate _delegate;

  ExperienceBloc() : super(InitExperienceState()) {
    _repository = ExperienceRepository.instance;

    on<GetEtalaseExperience>((event, emit) async {
      emit(ShowLoading());
      var data = await _repository.getExperienceEtalase(event.status); // 2 seconds
      if (data.status == 200) {
        emit(ShowEtalaseExperience(data.data ?? []));
      } else {}
    });

    on<GetDetailExperience>((event, emit) async {
      emit(ShowLoading());
      var data = await _repository.fetchExperienceDetail(event.uuidExperience);
      if (data.status == 200) {
        emit(ShowDetailExperience(data.data));
      } else {}
    });

    on<DeleteExperience>((event, emit) async {
      _delegate = event.delegate;
      _delegate.onLoading();
      var data = await _repository.deleteExperience(event.uuidExperience);
      if (data.status == 201) {
        _delegate.onSuccess(data.message ?? "");
      } else {
        _delegate.onError(data.message ?? "");
      }
    });

    on<CreateExperience>((event, emit) async {
      _delegate = event.delegate;
      _delegate.onLoading();
      var data = await _repository.createExperience(event.request);
      if (data.status == 201) {
        print(data.message);
        _delegate.onSuccess(data.message ?? "");
      } else {
        print(data.message);
        _delegate.onError(data.message ?? "");
      }
    });


  }
}
