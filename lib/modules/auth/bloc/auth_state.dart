abstract class AuthState {}

class InitAuthState extends AuthState {}

class ShowLoading extends AuthState {}

class ShowErrorRegister extends AuthState {}

class ShowErrorLogin extends AuthState {}

class ShowSuccessRegister extends AuthState {}

class ShowSuccessLogin extends AuthState {}
