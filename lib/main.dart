import 'package:flutter/material.dart';
import 'package:super_saler/ui/Login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:super_saler/ui/Registration.dart';
import '../bloc/UserLogin/user_login_bloc.dart';
import 'bloc/UserRegistration/user_registration_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserLoginBloc _authenticationBloc = UserLoginBloc();
  final UserRegistrationBloc _registrationBloc = UserRegistrationBloc();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserLoginBloc>(
          create: (context) => _authenticationBloc,
        ),
        BlocProvider<UserRegistrationBloc>(
          create: (context) => _registrationBloc,
        ),
      ],
      child: MaterialApp(
        title: 'super_sale',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/registration': (context) => RegistrationPage(),
        },
        home: LoginPage(),
      ),
    );
  }
}

