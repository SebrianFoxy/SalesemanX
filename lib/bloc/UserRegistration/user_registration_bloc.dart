import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:super_saler/Auth/auth.dart';

part 'user_registration_event.dart';
part 'user_registration_state.dart';

class UserRegistrationBloc extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  UserRegistrationBloc() : super(const UserRegistrationState()){
    on<RegistrationButtonPressedEvent>(_onRegistration);
    on<EmailChanged>(_emailChanged);
    on<FirstNameChanged>(_fistnameChanged);
    on<LastNameChanged>(_lastnameChanged);
    on<MiddleNameChanged>(_middlenameChanged);
    on<FirstPasswordChanged>(_firstPasswordChanged);
    on<SecondPasswordChanged>(_secondPasswordChanged);
    //on<EmailUnfocused>(_emailFocusLost);
    //on<EmailFocused>(_emailFocus);
  }

  _emailChanged(EmailChanged event, Emitter<UserRegistrationState> emit){
    emit(state.copyWith(email: event.email));
  }

  _fistnameChanged(FirstNameChanged event, Emitter<UserRegistrationState> emit) {
    emit(state.copyWith(firstName: event.firstName));
  }

  _lastnameChanged(LastNameChanged event, Emitter<UserRegistrationState> emit) {
    emit(state.copyWith(lastName: event.lastName));
  }

  _middlenameChanged(MiddleNameChanged event, Emitter<UserRegistrationState> emit) {
    emit(state.copyWith(middleName: event.middleName));
  }

  _firstPasswordChanged(FirstPasswordChanged event, Emitter<UserRegistrationState> emit){
    emit(state.copyWith(firstPassword: event.firstPassword));
  }

  _secondPasswordChanged(SecondPasswordChanged event, Emitter<UserRegistrationState> emit){
    emit(state.copyWith(secondPassword: event.secondPassword));
  }

  _onRegistration(RegistrationButtonPressedEvent event, Emitter<UserRegistrationState> emit) async {
    emit(state.copyWith(isLoading: true));
    
    try{
      bool registrationUser = await registration(event.firstName, event.lastName, event.middleName, event.email, event.password);
      if (registrationUser){
        bool sendMailUser = await sendMail(event.email, event.password);
        if (sendMailUser){
          emit(state.copyWith(sendEmail: true));
        }
      }
    }catch(e){
      debugPrint('newError: $e');
    }
    
    emit(state.copyWith(email: '', firstName: '', lastName: '', middleName: '', firstPassword: '', secondPassword: ''));
  }

  /*
  _emailFocusLost(EmailUnfocused event, Emitter<UserRegistrationState> emit){
    emit(state.copyWith(isEmailFocused: false));
  }

  _emailFocus(EmailFocused event, Emitter<UserRegistrationState> emit){
    emit(state.copyWith(isEmailFocused: true));
  }
  */

  
}