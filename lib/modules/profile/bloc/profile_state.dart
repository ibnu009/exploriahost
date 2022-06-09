import 'package:exploriahost/core/network/response/profile/host_profile.dart';

abstract class ProfileState {}

class InitProfileState extends ProfileState {}

class ShowHostLoading extends ProfileState {}

class ShowHostProfile extends ProfileState {
  HostProfile profile;

  ShowHostProfile(this.profile);
}
