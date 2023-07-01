part of 'user_registration_bloc.dart';

@immutable
abstract class UserRegistrationState {}

class UserRegistrationInitial extends UserRegistrationState {}

class UserRegistrationAccessState extends UserRegistrationState {}

class UserRegistrationLoadingState extends UserRegistrationState {}

class UserRegistrationFailedState extends UserRegistrationState {}

class UserRegistrationFailureState extends UserRegistrationState {
  final String error;

  UserRegistrationFailureState({required this.error});
}

/*
class RegistrationState extends UserRegistrationState{
  final String firstName;
  bool get isValidFirstName => firstName.length > 3;

  final String lastName;
  bool get isValidLastName => lastName.length > 3;

  final String middleName;
  bool get isValidMiddleName => middleName.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final String email;
  
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  RegistrationState({
    required this.firstName,
    required this.lastName,
    required this.middleName,
    required this.password,
    required this.email,
  });

  factory RegistrationState.copyWith({
    String? firstName,
    String? lastName,
    String? middleName,
    String? email,
    String? password,
  }){
    return RegistrationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
*/