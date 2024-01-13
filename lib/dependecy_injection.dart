import 'package:get/get.dart';
import 'package:novelty/controllers/network_controller.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/services/local_storage.dart';

class DependencyInjection {
  static Future<void> init() async {
    await Get.putAsync<AuthService>(() async {
      AuthService authService = AuthService();
      await authService.init();
      return authService;
    }, permanent: true);

    // await Get.putAsync(() async => AuthService()..init(), permanent: true);

    Get.put<AppController>(AppController(), permanent: true);
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.put<UserService>(UserService(), permanent: true);
  }
}
