import 'package:exploriahost/core/repository/user_repository.dart';
import 'package:exploriahost/modules/profile/bloc/profile_event.dart';
import 'package:exploriahost/modules/profile/bloc/profile_state.dart';
import 'package:exploriahost/utils/generic_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late UserRepository _repository;
  late GenericDelegate _delegate;

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
      _delegate = event.delegate;
      _delegate.onLoading();
      var data = await _repository.verifyHostProfile(event.request, event.file);
      if (data.status == 200 || data.status == 201) {
        _delegate.onSuccess(data.message ?? "");
        print(data.message);
      } else {
        _delegate.onError(data.message ?? "");
      }
    });
  }
}
