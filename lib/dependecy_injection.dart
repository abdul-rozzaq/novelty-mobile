import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/controllers/network_controller.dart';
import 'package:novelty/services/local_storage.dart';

class DependencyInjection {
  static void init() {
    AuthService service = Get.put<AuthService>(AuthService(), permanent: true);

    Get.put<UserService>(UserService(), permanent: true);

    Get.put<NetworkController>(NetworkController(), permanent: true);

    if (service.get() != null) {
      Get.put<AppController>(AppController(), permanent: true);
    }
  }
}
