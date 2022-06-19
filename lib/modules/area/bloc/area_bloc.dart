import 'package:exploriahost/core/repository/area_repository.dart';
import 'package:exploriahost/modules/area/bloc/area_event.dart';
import 'package:exploriahost/modules/area/bloc/area_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AreaBloc extends Bloc<AreaEvent, AreaState> {
  late AreaRepository _repository;

  AreaBloc() : super(InitAreaState()) {
    _repository = AreaRepository.instance;

    on<GetProvinces>((event, emit) async {
      emit(ShowLoadingArea());
      var data = await _repository.fetchProvinces(event.query);
      if (data.status == 200) {
        emit(ShowProvinces(data.data));
      } else {}
    });

    on<GetCities>((event, emit) async {
      emit(ShowLoadingArea());
      var data = await _repository.fetchCities(event.provinceId,event.query);
      if (data.status == 200) {
        emit(ShowCities(data.data));
      } else {}
    });
  }

}