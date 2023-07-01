import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/UserLogin/user_login_bloc.dart';
import 'package:flutter/gestures.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  bool? _savePassword = false;

  @override
  Widget build(BuildContext context) {
    final UserLoginBloc bloc = BlocProvider.of<UserLoginBloc>(context);
    return Scaffold(
      body: BlocBuilder<UserLoginBloc, UserLoginState>(
      builder: (context, state) {
        if (state is UserLoginAuthenticationState) {
          return const Scaffold(
            body: Center(
              child: Text('Пользователь авторизован'),
            ),
          );
        } else if (state is UserLoginInitial) {
          return BlocProvider<UserLoginBloc>(
            create: (context) => bloc,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Form(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              icon: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  child: Icon(Icons.people),
                                ),
                              ),
                              hintText: "example@company.com",
                              hintStyle: TextStyle(fontFamily: 'Nexa'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Пароль',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, left: 10, right: 15),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                controller: _passwordController,
                                obscureText: _obscureText,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: Icon(Icons.lock),
                                    ),
                                  ),
                                  hintText: "Пароль",
                                  hintStyle: TextStyle(fontFamily: 'Nexa'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.only(left: 0),
                              title: Text(
                                "Сохранить пароль",
                                style: TextStyle(fontFamily: 'Nexa'),
                              ),
                              leading: Checkbox(
                                value: _savePassword,
                                onChanged: (value) {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                visualDensity: VisualDensity.compact,
                                activeColor: Colors.black,
                                checkColor: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/registration');
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              child: Text(
                                'Забыл пароль?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 44, 44, 44),
                                  fontFamily: 'Nexa',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        bloc.add(
                          SignInButtonPressedEvent(
                            email: _emailController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 44, 44),
                        minimumSize: Size(220, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Войти', style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        text: 'Нет аккаунта? ',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Создать аккаунт',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 44, 44),
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/registration');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        else if (state is UserLoginAuthenticationLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is UserLoginAuthenticationFailedState){
          bloc.add(ResetUserLoginEvent());
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Логин или пароль неверны'),
              ),
            );
          });
          return const Scaffold();
        }
        else{
          return const Scaffold();
        }
      },
    )
    );
  }
}
