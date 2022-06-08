import 'package:exploriahost/core/network/response/home/home_content_response.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class ShowHomeLoading extends HomeState {}

class ShowHomeContent extends HomeState {
  HomeContent homeContent;
  ShowHomeContent(this.homeContent);
}

