import 'package:dio/dio.dart';
import 'package:super_saler/dio/dioInfo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


Future<bool> login(String email, String password) async {
  const endpoint = '/auth/login';
  final Map<String, dynamic> data = {
    "email": email,
    "password": password,
  };
  try {
    final response = await ApiService.post(endpoint, data);
    print(response.data.toString());
    return true;
  } on DioException catch (e) {
    print('Error: ${e.response}');
    return false;
  }
}
