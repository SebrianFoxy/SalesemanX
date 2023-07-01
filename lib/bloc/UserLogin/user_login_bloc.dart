import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:super_saler/Auth/auth.dart';

part 'user_login_event.dart';
part 'user_login_state.dart';

class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc() : super(UserLoginInitial()){
    on<SignInButtonPressedEvent>(_onLogin);
    on<ResetUserLoginEvent>(_onReset);
  }

  _onLogin(SignInButtonPressedEvent event, Emitter<UserLoginState> emit) async {
    emit(UserLoginAuthenticationLoadingState());

    try{
      bool authenticated = await login(event.email, event.password);
      if (authenticated) {
        emit(UserLoginAuthenticationState());
      } else {
        emit(UserLoginAuthenticationFailedState());
      }
    }catch(error){
      emit(UserLoginAuthenticationFailureState(error: error.toString()));
    }
  }

  _onReset(
    ResetUserLoginEvent event,
    Emitter<UserLoginState> emit,
  ) {
    emit(UserLoginInitial());
  }
  
}
