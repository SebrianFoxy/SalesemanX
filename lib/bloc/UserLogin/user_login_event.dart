part of 'user_login_bloc.dart';

@immutable
sealed class UserLoginEvent {
  @override
  List<Object> get props => [];
}

class EmailChanged extends UserLoginEvent {
  final String email;

  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends UserLoginEvent {
  final String password;

  PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class SignInButtonPressedEvent extends UserLoginEvent {
  final String email;
  final String password;

  SignInButtonPressedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
