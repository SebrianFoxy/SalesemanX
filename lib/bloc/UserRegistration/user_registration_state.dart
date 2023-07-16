part of 'user_registration_bloc.dart';



class UserRegistrationState extends Equatable {
  final String firstName;
  bool get isValidFirstName => firstName.length > 3 && RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(firstName);

  final String lastName;
  bool get isValidLastName => lastName.length > 3 && RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(lastName);

  final String middleName;
  bool get isValidMiddleName => middleName.length > 3 && RegExp(r'^[a-zA-Zа-яА-Я]+$').hasMatch(middleName);

  final String firstPassword;
  bool get isValidfirstPassword => firstPassword.length >= 6;

  final String secondPassword;
  bool get isValidsecondPassword => secondPassword.length >= 6;

  final String email;
  bool get isValidEmail {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  final bool isLoading;
  final bool sendEmail;

  bool get isValidButton =>(
    email.isNotEmpty && 
    firstName.isNotEmpty && 
    lastName.isNotEmpty && 
    middleName.isNotEmpty && 
    firstPassword.isNotEmpty && 
    secondPassword.isNotEmpty);
  //final bool isEmailFocused;

  const UserRegistrationState({
    this.firstName = '',
    this.lastName = '',
    this.middleName = '',
    this.firstPassword = '',
    this.secondPassword = '',
    this.email = '',
    this.isLoading = false,
    this.sendEmail = false,
    //this.isEmailFocused = false,
  });

  UserRegistrationState copyWith({
    String? firstName,
    String? lastName,
    String? middleName,
    String? email,
    String? firstPassword,
    String? secondPassword,
    bool isLoading = false,
    bool sendEmail = false,
    //bool isEmailFocused = false,
  }){
    return UserRegistrationState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      middleName: middleName ?? this.middleName,
      email: email ?? this.email,
      firstPassword: firstPassword ?? this.firstPassword,
      secondPassword: secondPassword ?? this.secondPassword,
      isLoading: isLoading,
      sendEmail: sendEmail,
      //isEmailFocused: isEmailFocused,
    );
  }

  @override
  List<Object> get props => [email, firstName, lastName, middleName,firstPassword, secondPassword, isLoading, isValidButton];
}