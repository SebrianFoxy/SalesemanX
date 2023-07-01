part of 'user_registration_bloc.dart';

@immutable
abstract class UserRegistrationEvent {}

class EmailChanged extends UserRegistrationEvent{
  final String email;

  EmailChanged(this.email);
}

class FirstNameChanged extends UserRegistrationEvent {
  final String firstName;

  FirstNameChanged(this.firstName);
}

class LastNameChanged extends UserRegistrationEvent {
  final String lastName;

  LastNameChanged(this.lastName);
}

class MiddleNameChanged extends UserRegistrationEvent {
  final String middleName;

  MiddleNameChanged(this.middleName);
}

class PasswordChanged extends UserRegistrationEvent {
  final String password;

  PasswordChanged(this.password);
}

