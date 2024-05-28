part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChange extends LoginEvent {
  final String email;

  const EmailChange({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChange extends LoginEvent {
  final String password;

  const PasswordChange({required this.password});

  @override
  List<Object> get props => [password];
}

class LoginApi extends LoginEvent {}
