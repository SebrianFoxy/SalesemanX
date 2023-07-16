import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/UserRegistration/user_registration_bloc.dart';
import 'package:flutter/gestures.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRegistrationBloc bloc =
        BlocProvider.of<UserRegistrationBloc>(context);
    return Scaffold(
      body: BlocConsumer<UserRegistrationBloc, UserRegistrationState>(
        listener: (context, state) {
          if (state.sendEmail) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Письмо отправлено на почту'),
                  content: const Text(
                    'Перейдите по ссылке, отправленную на почту, а после авторизуйтесь',
                  ),
                  actions: [
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                        child: const Text('Oк'),
                      ),
                    )
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          return BlocBuilder<UserRegistrationBloc, UserRegistrationState>(
            builder: (context, state) {
              if (state.isLoading == false) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  body: ListView(
                    children: <Widget>[
                      Column(children: [
                        const SizedBox(height: 50),
                        const Column(
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
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, right: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Фамилия',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Form(
                                child: TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: "Иванов",
                                      prefixIcon: Icon(Icons.people,
                                          color: Colors.black),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      context
                                          .read<UserRegistrationBloc>()
                                          .add(LastNameChanged(
                                              lastName: value));
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Имя',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Form(
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Иван",
                                    prefixIcon: Icon(Icons.people,
                                        color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    context.read<UserRegistrationBloc>().add(
                                        FirstNameChanged(firstName: value));
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Отчество',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Form(
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Иванович",
                                    prefixIcon: Icon(Icons.people,
                                        color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    context.read<UserRegistrationBloc>().add(
                                        MiddleNameChanged(middleName: value));
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Form(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "example@company.com",
                                    prefixIcon: Icon(Icons.mail),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    context
                                        .read<UserRegistrationBloc>()
                                        .add(EmailChanged(email: value));
                                  },
                                ),
                              ),
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Пароль',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Form(
                              child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "Пароль",
                                    prefixIcon: Icon(Icons.lock),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    context.read<UserRegistrationBloc>().add(
                                        FirstPasswordChanged(
                                            firstPassword: value));
                                  }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Подтвердите пароль',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Form(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Подтвердить пароль",
                                  prefixIcon: Icon(Icons.lock),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)),
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  context.read<UserRegistrationBloc>().add(
                                      SecondPasswordChanged(
                                          secondPassword: value));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: ElevatedButton(
                          onPressed: state.isValidButton
                              ? () {
                                  String email = context
                                      .read<UserRegistrationBloc>()
                                      .state
                                      .email;
                                  String firstName = context
                                      .read<UserRegistrationBloc>()
                                      .state
                                      .firstName;
                                  String lastName = context
                                      .read<UserRegistrationBloc>()
                                      .state
                                      .lastName;
                                  String middleName = context
                                      .read<UserRegistrationBloc>()
                                      .state
                                      .middleName;
                                  String firstPassword = context
                                      .read<UserRegistrationBloc>()
                                      .state
                                      .firstPassword;
                                  String secondPassword = context
                                      .read<UserRegistrationBloc>()
                                      .state
                                      .secondPassword;

                                  debugPrint("1: $email");
                                  debugPrint("2: $firstName");
                                  debugPrint("3: $lastName");
                                  debugPrint("4: $middleName");
                                  debugPrint("5: $firstPassword");
                                  debugPrint("6: $secondPassword");

                                  if (state.isValidEmail == false) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Почта введена неверно!')),
                                      );
                                  } else if (state.isValidFirstName ==
                                          false ||
                                      state.isValidLastName == false ||
                                      state.isValidMiddleName == false) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Фамилия/Имя/Отчество некорректно заполнены')),
                                      );
                                  } else if (firstPassword !=
                                      secondPassword) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Пароли несовпадают')),
                                      );
                                  } else if (state.isValidfirstPassword ==
                                      false) {
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Пароль должен состоять из 6 и более символов')),
                                      );
                                  } else {
                                    bloc.add(RegistrationButtonPressedEvent(
                                        email: email,
                                        firstName: firstName,
                                        lastName: lastName,
                                        middleName: middleName,
                                        password: firstPassword));
                                  }
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 44, 44, 44),
                            minimumSize: const Size(200, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Зарегистрироваться',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Уже есть аккаунт? ',
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Войти',
                                style: const TextStyle(
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
                      ),
                      const SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                );
              } else if (state.isLoading == true) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Scaffold();
              }
            },
          );
        },
      ),
    );
  }
}
