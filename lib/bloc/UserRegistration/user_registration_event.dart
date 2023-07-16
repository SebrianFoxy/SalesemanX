part of 'user_registration_bloc.dart';

@immutable
sealed class UserRegistrationEvent {

  @override
  List<Object> get props => [];
}

class EmailChanged extends UserRegistrationEvent{
  final String email;

  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class FirstNameChanged extends UserRegistrationEvent {
  final String firstName;

  FirstNameChanged({required this.firstName});

  @override
  List<Object> get props => [firstName];
}

class LastNameChanged extends UserRegistrationEvent {
  final String lastName;

  LastNameChanged({required this.lastName});

  @override
  List<Object> get props => [lastName];
}

class MiddleNameChanged extends UserRegistrationEvent {
  final String middleName;

  MiddleNameChanged({required this.middleName});

  @override
  List<Object> get props => [middleName];
}

class FirstPasswordChanged extends UserRegistrationEvent {
  final String firstPassword;

  FirstPasswordChanged({required this.firstPassword});

  @override
  List<Object> get props => [firstPassword];
}

class SecondPasswordChanged extends UserRegistrationEvent {
  final String secondPassword;

  SecondPasswordChanged({required this.secondPassword});

  @override
  List<Object> get props => [secondPassword];
}

class RegistrationButtonPressedEvent extends UserRegistrationEvent {
  final String email;
  final String firstName;
  final String lastName;
  final String middleName;
  final String password;

  RegistrationButtonPressedEvent({required this.email, required this.firstName, required this.lastName, required this.middleName, required this.password});

  @override
  List<Object> get props => [email, firstName, lastName, middleName, password];
}


