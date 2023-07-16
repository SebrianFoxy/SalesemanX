import 'package:dio/dio.dart';


class ApiService {
  static final Dio _dio = Dio();
  static const _baseUrl = 'https://xsalesman.yuzum.ru/api/v1';
  
  static Future<Response> post(String endpoint, dynamic data) async {
    try {
      _dio.options.headers['Content-Type'] = 'application/json';
      _dio.options.headers['accept'] = 'application/json';
      _dio.options.connectTimeout = const Duration(milliseconds: 5000);
      _dio.options.receiveTimeout = const Duration(milliseconds: 5000);

      final Response response = await _dio.post(_baseUrl + endpoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

