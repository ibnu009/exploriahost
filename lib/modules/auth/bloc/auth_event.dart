import 'package:exploriahost/modules/auth/helper/auth_delegate.dart';

abstract class AuthEvent {}

class LoginUser extends AuthEvent {
  String email, password;
  AuthDelegate delegate;
  LoginUser({required this.email, required this.password, required this.delegate});
}

class RegisterUser extends AuthEvent {
  Map<String, Object> map;
  AuthDelegate delegate;
  RegisterUser(this.map, this.delegate);
}