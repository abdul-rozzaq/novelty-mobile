import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:novelty/models/token_model.dart';
import 'package:novelty/services/local_storage.dart';

class DioClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.132.65:8000',
    // baseUrl: 'https://webnovelty.pythonanywhere.com',

    headers: {'Content-Type': 'application/json'},
  ));

  DioClient() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.validateStatus = (status) {
            return status != null && status < 500;
          };

          Token? token = await AuthService().get();

          if (token != null) {
            options.headers["Authorization"] = "Token ${token.key}";
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          debugPrint('Error $e');

          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;
}
