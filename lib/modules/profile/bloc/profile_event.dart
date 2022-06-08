import 'dart:io';

import 'package:exploriahost/core/network/request/verify_profile_request.dart';

abstract class ProfileEvent {}

class GetHostProfile extends ProfileEvent {}

class VerifyHostProfile extends ProfileEvent {
  VerifyProfileRequest request;
  File file;
  VerifyHostProfile(this.request, this.file);
}

