import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';

class NetworkController extends GetxController {
  final Connectivity connectivity = Connectivity();

  @override
  void onInit() async {
    super.onInit();

    connectivity.onConnectivityChanged.listen(updateStatus);
  }

  updateStatus(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Get.snackbar(
        'Aloqa uzilgan',
        'Internet aloqasini tekshiring',
        colorText: Colors.white,
        isDismissible: false,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        duration: const Duration(days: 1),
        backgroundColor: Colors.red,
        icon: const Icon(
          Icons.wifi_off_rounded,
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(10),
        snackStyle: SnackStyle.FLOATING,
        forwardAnimationCurve: Curves.easeInOutExpo,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();

        Get.find<AppController>().startLoad();
      }
    }
  }

  firstCheck() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    updateStatus(result);
  }
}
