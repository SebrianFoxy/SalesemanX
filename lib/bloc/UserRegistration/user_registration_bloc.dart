import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_registration_event.dart';
part 'user_registration_state.dart';

class UserRegistrationBloc extends Bloc<UserRegistrationEvent, UserRegistrationState> {
  UserRegistrationBloc() : super(UserRegistrationInitial());

}