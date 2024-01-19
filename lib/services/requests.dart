import 'package:get/get.dart';
import 'package:novelty/models/token_model.dart';
import 'package:novelty/services/local_storage.dart';

class Requests {
  // static String domain = 'http://192.168.1.2:8000';
  static String domain = 'https://webnovelty.pythonanywhere.com';
  // static String domain = 'http://0.0.0.0:8000';

  static Future<Response> fetchData(String uri) async {
    Token? token = Get.find<AuthService>().get();

    return await GetConnect(timeout: const Duration(minutes: 55)).get(domain + uri, headers: {'Authorization': 'Token ${token?.key}'});
  }

  static Future<Response> postData(String uri, Map<String, dynamic> body) async {
    return await GetConnect(timeout: const Duration(minutes: 55)).post(domain + uri, body);
  }

  static Future<Response> putData(String uri, Map<String, dynamic> body) async {
    return await GetConnect(timeout: const Duration(minutes: 55)).put(domain + uri, body);
  }

  static Future<Response> deleteData(String uri) async {
    return await GetConnect(timeout: const Duration(minutes: 55)).delete(domain + uri);
  }
}
