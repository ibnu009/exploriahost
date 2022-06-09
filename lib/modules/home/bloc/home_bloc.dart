import 'package:exploriahost/core/network/response/generic_response.dart';
import 'package:exploriahost/core/repository/home_repository.dart';
import 'package:exploriahost/modules/home/bloc/home_event.dart';
import 'package:exploriahost/modules/home/bloc/home_state.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late HomeRepository _repository;

  HomeBloc() : super(InitHomeState()) {
    _repository = HomeRepository.instance;

    on<GetHomeContent>((event, emit) async {
      emit(ShowHomeLoading());
      var data = await _repository.fetchHostHomeContent();
      if (data.status == 200) {
        emit(ShowHomeContent(data.data));
      } else {}
    });

    on<SendFirebaseToken>((event, emit) async {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      GenericResponse data =
          await _repository.sendFirebaseToken(fcmToken ?? "");

      print("fcmToken is $fcmToken");
      print(data.message);
    });
  }
}
