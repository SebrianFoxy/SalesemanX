import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/UserRegistration/user_registration_bloc.dart';
import 'package:flutter/gestures.dart';



class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRegistrationBloc bloc = BlocProvider.of<UserRegistrationBloc>(context);
    return Scaffold(
      body: BlocBuilder<UserRegistrationBloc, UserRegistrationState>(
        builder: (context, state) {
          if (state is UserRegistrationInitial) {
            return BlocProvider<UserRegistrationBloc>(
              create: (context) => bloc,
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                            'SalesmanX',
                            style: TextStyle(
                              fontSize: 38,
                              //  fontWeight: FontWeight.bold,
                              ),
                            ),
                          SizedBox(height: 30),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, top: 10,right: 30),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Фамилия',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Form(
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                                child: Icon(Icons.people,color: Colors.black),
                                              ),
                                            ),
                                            hintText: "Иванов",
                                            hintStyle: TextStyle(fontFamily: 'Nexa'),
                                          ),
                                          onChanged: (value){

                                          }
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10,right: 30),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Form(
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                          child: Icon(Icons.email),
                                        ),
                                      ),
                                      hintText: "example@company.com",
                                      hintStyle: TextStyle(fontFamily: 'Nexa'),
                                    ),
                                  ),
                                ),
                              ),
                                  ],
                            ),
                          ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, top: 10,right: 30),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Имя',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Form(
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                                child: Icon(Icons.people,color: Colors.black),
                                              ),
                                            ),
                                            hintText: "Иван",
                                            hintStyle: TextStyle(fontFamily: 'Nexa'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10,right: 30),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Пароль',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Form(
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                      hintText: "Пароль",
                                      hintStyle: TextStyle(fontFamily: 'Nexa'),
                                    ),
                                  ),
                                ),
                              ),
                                  ],
                            ),
                          ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 30, top: 10,right: 30),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Отчество',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      child: Form(
                                        child: TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                                child: Icon(Icons.people,color: Colors.black,),
                                              ),
                                            ),
                                            hintText: "Иванович",
                                            hintStyle: TextStyle(fontFamily: 'Nexa'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10, top: 10,right: 30),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Подтвердите пароль',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Form(
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                      hintText: "Подтвердить пароль",
                                      hintStyle: TextStyle(fontFamily: 'Nexa'),
                                    ),
                                  ),
                                ),
                              ),
                                  ],
                            ),
                          ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // bloc.add(
                        //   SignInButtonPressedEvent(
                        //     email: _emailController.text,
                        //     password: _passwordController.text,
                        //   ),
                        // );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 44, 44, 44),
                        minimumSize: Size(450, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text('Зарегистрироваться', style: TextStyle(fontSize: 16)),
                    ),
                    SizedBox(height: 20),
                    Text.rich(
                      TextSpan(
                        text: 'Уже есть аккаунт? ',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Войти',
                            style: TextStyle(
                              color: Color.fromARGB(255, 44, 44, 44),
                              fontSize: 14,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/login');
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
          } else {
            return Scaffold();
          }
        },
      ),
    );
  }
}