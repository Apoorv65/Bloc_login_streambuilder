part of 'login_bloc.dart';


abstract class LoginEvent {}

class LogInTextChangeEvent extends LoginEvent {
  final String _email;
  final String _password;

  LogInTextChangeEvent(
    this._email,
    this._password,
  );
}

class LogInSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LogInSubmittedEvent(
    this.email,
    this.password,
  );
}


