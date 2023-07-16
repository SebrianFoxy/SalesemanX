import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:super_saler/Auth/auth.dart';
import 'form_sumbission_status.dart';


part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(const UserLoginState()){
    on<SignInButtonPressedEvent>(_onLogin);
    on<EmailChanged>(_emailChanged);
    on<PasswordChanged>(_passwordChanged);
  }

  _emailChanged(EmailChanged event, Emitter<UserLoginState> emit) {
    emit(state.copyWith(email: event.email));
  }

  _passwordChanged(PasswordChanged event, Emitter<UserLoginState> emit){
    emit(state.copyWith(password: event.password));
  }

  _onLogin(SignInButtonPressedEvent event, Emitter<UserLoginState> emit) async {
    emit(state.copyWith(formStatus: FormSubmitting()));

    try{
      bool loginUser = await login(event.email, event.password);
      if (loginUser){
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      }
      else {
        emit(state.copyWith(formStatus: SubmissionFailure()));
        emit(state.copyWith(formStatus: const InitialFormStatus()));
      }
    }catch(error){
      emit(state.copyWith(formStatus: SubmissionFailed(error)));
    }
  }

  // _onReset(
  //   ResetUserLoginEvent event,
  //   Emitter<UserLoginState> emit,
  // ) {
  //   emit(UserLoginInitial());
  // }
  
}
