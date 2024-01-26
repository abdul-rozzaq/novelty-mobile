import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/controllers/network_controller.dart';
import 'package:novelty/services/local_storage.dart';

class DependencyInjection {
  static Future<void> init() async {
    AuthService service = Get.put<AuthService>(AuthService(), permanent: true);

    Get.put<UserService>(UserService(), permanent: true);

    Get.put<NetworkController>(NetworkController(), permanent: true);

    if (service.get() != null) {
      Get.putAsync<AppController>(() async => AppController(), permanent: true);
    }
  }
}
