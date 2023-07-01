part of 'user_login_bloc.dart';

@immutable
abstract class UserLoginState {}

class UserLoginInitial extends UserLoginState {}

class UserLoginAuthenticationState extends UserLoginState{}

class UserLoginAuthenticationLoadingState extends UserLoginState {}

class UserLoginAuthenticationFailedState extends UserLoginState {}

class UserLoginAuthenticationFailureState extends UserLoginState {
  final String error;

  UserLoginAuthenticationFailureState({required this.error});
}
