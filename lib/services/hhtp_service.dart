import 'package:dio/dio.dart';

class HhtpService {
  HhtpService() {
    configureDio();
  }

  final dio = Dio(); // With default `Options`.

  void configureDio() {
    // Set default configs
    dio.options.baseUrl = 'https://fakestoreapi.com';
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
  }
}
