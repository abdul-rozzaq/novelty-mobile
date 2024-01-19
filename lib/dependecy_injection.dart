import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/controllers/network_controller.dart';
import 'package:novelty/services/local_storage.dart';

class DependencyInjection {
  static Future<void> init() async {
    AuthService service = await Get.putAsync<AuthService>(() async {
      AuthService authService = AuthService();
      await authService.init();
      return authService;
    }, permanent: true);

    await Get.putAsync<UserService>(() async {
      UserService authService = UserService();
      await authService.init();
      return authService;
    }, permanent: true);

    Get.put<NetworkController>(NetworkController(), permanent: true);

    if (service.get() != null) {
      Get.putAsync<AppController>(() async => AppController(), permanent: true);
    }
  }
}
