import 'package:exploriahost/core/repository/user_repository.dart';
import 'package:exploriahost/modules/profile/bloc/profile_event.dart';
import 'package:exploriahost/modules/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late UserRepository _repository;

  ProfileBloc() : super(InitProfileState()) {
    _repository = UserRepository.instance;

    on<GetHostProfile>((event, emit) async {
      emit(ShowHostLoading());
      var data = await _repository.fetchHostProfile();
      if (data.status == 200) {
        emit(ShowHostProfile(data.data));
      } else {}
    });

    on<VerifyHostProfile>((event, emit) async {
      emit(ShowHostLoading());
      var data = await _repository.verifyHostProfile(event.request, event.file);
      if (data.status == 200) {
        print(data.message);
      } else {}
    });
  }
}
