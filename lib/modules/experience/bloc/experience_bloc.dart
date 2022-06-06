import 'package:exploriahost/core/repository/experience_repository.dart';
import 'package:exploriahost/modules/experience/bloc/experience_event.dart';
import 'package:exploriahost/modules/experience/bloc/experience_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceBloc extends Bloc<ExperienceEvent, ExperienceState> {
  late ExperienceRepository _repository;

  ExperienceBloc() : super(InitExperienceState()) {
    _repository = ExperienceRepository.instance;

    on<GetEtalaseExperience>((event, emit) async {
      emit(ShowLoading());
      var data = await _repository.getExperienceEtalase(event.status);
      if (data.status == 200) {
        emit(ShowEtalaseExperience(data.data ?? []));
      } else {
      }
    });

    on<CreateExperience>((event, emit) async {
      emit(ShowLoading());
      var data = await _repository.createExperience(event.request);
      if (data.status == 201) {
        print(data.message);
      } else {
        print(data.message);
      }
    });
  }
}
