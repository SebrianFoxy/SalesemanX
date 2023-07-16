import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:super_saler/Auth/auth_errors.dart';
import 'package:super_saler/dio/dio_info.dart';



Future<bool> login(String email, String password) async {
  const endpoint = '/auth/login';
  final Map<String, dynamic> data = {
    "email": email,
    "password": password,
  };
  try {
    final response = await ApiService.post(endpoint, data);
    debugPrint(response.data.toString());
    return true;
  } on DioException catch (e) {
    debugPrint('Error: ${e.response?.data['message'].toString()}');
    final ErrorMessage = e.response?.data['message'].toString();
    return false;
  }
}

Future<bool> registration(String firstName, String lastName, String middleName, String email, String password) async{
  const endpoint = '/auth/registration';
  final Map<String, dynamic> data = {
    "firstName": firstName,
    "lastName": lastName,
    "middleName": middleName,
    "email": email,
    "password": password,
  };
  try{
    final response = await ApiService.post(endpoint, data);
    print(response.data.toString());
    return true;
  }on DioException catch (e) {
    debugPrint('regError: ${e.response!.statusCode}');
    debugPrint('regError: ${e.response!.statusMessage}');
    return false;
  }
}

Future<bool> sendMail(String email, String password) async{
  const endpoint = '/auth/mail_sender';
  final Map<String, dynamic> data = {
    "email": email,
    "password": password,
  };
  try{
    final response = await ApiService.post(endpoint, data);
    debugPrint(response.data.toString());
    return true;
  }on DioException catch (e) {
    debugPrint('mailError: ${e.response!.statusCode}');
    return false;
  }
}