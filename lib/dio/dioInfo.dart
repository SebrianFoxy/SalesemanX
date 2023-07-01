import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:super_saler/text/text.dart';


class ApiService {
  static final Dio _dio = Dio();
  
  static Future<Response> post(String endpoint, dynamic data) async {
    try {
      _dio.options.headers['Content-Type'] = 'application/json';
      _dio.options.headers['accept'] = 'application/json';

      final Response response = await _dio.post(myApi + endpoint, data: data);
      return response;
    } catch (e) {
      print('Error occurred: $e');
      throw e;
    }
  }
}

