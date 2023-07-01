part of 'user_login_bloc.dart';

@immutable
abstract class UserLoginEvent {}

class SignInButtonPressedEvent extends UserLoginEvent {
  final String email;
  final String password;

  SignInButtonPressedEvent({required this.email, required this.password});
}

class ResetUserLoginEvent extends UserLoginEvent {}
