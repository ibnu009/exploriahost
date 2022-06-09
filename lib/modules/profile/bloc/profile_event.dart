import 'dart:io';

import 'package:exploriahost/core/network/request/verify_profile_request.dart';
import 'package:exploriahost/utils/generic_delegate.dart';

abstract class ProfileEvent {}

class GetHostProfile extends ProfileEvent {}

class VerifyHostProfile extends ProfileEvent {
  VerifyProfileRequest request;
  File file;
  GenericDelegate delegate;

  VerifyHostProfile(this.request, this.file, this.delegate);
}

