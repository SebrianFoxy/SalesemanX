import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/UserLogin/user_login_bloc.dart';
// import 'package:flutter/gestures.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60, // Высота полоски
              color: Color.fromRGBO(16, 1, 42, 100), // Цвет полоски
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      // Обработка нажатия на иконку меню
                    },
                  ),
                  // Добавьте остальной контент вашего экрана здесь
                ],
              ),
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.add_alert_rounded),
                    iconSize: 30,
                    onPressed: () {
                      // Обработка нажатия на иконку меню
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle),
                    iconSize: 30,
                    onPressed: () {
                      // Обработка нажатия на иконку меню
                    },
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
