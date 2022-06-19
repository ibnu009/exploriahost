import 'package:exploriahost/core/repository/user_repository.dart';
import 'package:exploriahost/modules/auth/bloc/auth_event.dart';
import 'package:exploriahost/modules/auth/bloc/auth_state.dart';
import 'package:exploriahost/modules/auth/helper/auth_delegate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late UserRepository _repository;
  late AuthDelegate _delegate;

  AuthBloc() : super(InitAuthState()) {
    _repository = UserRepository.instance;
    on<RegisterUser>((event, emit) async {
      _delegate = event.delegate;
      emit(ShowLoading());
      _delegate.onLoading();
      try {
        var data = await _repository.submitRegister(event.name, event.email, event.password);
        if (data.status == 200) {
          _delegate.onSuccess();
        }
         else {
          _delegate.onError(data.message ?? "");
        }
      } catch (ex) {
        _delegate.onError("Terjadi kesalahan : $ex");
      }
    });

    on<LoginUser>((event, emit) async {
      _delegate = event.delegate;
      emit(ShowLoading());
      _delegate.onLoading();
      try {
        var data = await _repository.submitLogin(event.email, event.password);
        if (data.status == 200) {
          _repository.writeSecureTokenData('token', data.token ?? "");
          _repository.writeSecureTokenData('email', event.email);
          _delegate.onSuccess();
        } else {
          _delegate.onError(data.message ?? "");
        }
      } catch (ex) {
        _delegate.onError("Terjadi kesalahan : $ex");
      }
    });
  }
}
