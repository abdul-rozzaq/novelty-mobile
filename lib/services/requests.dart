import 'package:get/get.dart';
import 'package:novelty/services/local_storage.dart';

class Requests {
  static String domain = 'http://192.168.1.2:8000';
  // static String domain = 'http://192.168.223.65:8000';
  // static String domain = 'http://192.168.137.65:8000';

  static Future<Response> fetchData(String uri) async {
    Map token = Get.find<AuthService>().get();

    var response = await GetConnect().get(domain + uri, headers: {'Authorization': 'Token ${token['key']}'});
    return response;
  }

  static Future<Response> postData(String uri, Map<String, dynamic> body) async {
    var response = await GetConnect().post(domain + uri, body);
    return response;
  }

  static Future<Response> putData(String uri, Map<String, dynamic> body) async {
    var response = await GetConnect().put(domain + uri, body);
    return response;
  }

  static Future<Response> deleteData(String uri) async {
    var response = await GetConnect().delete(domain + uri);
    return response;
  }
}
