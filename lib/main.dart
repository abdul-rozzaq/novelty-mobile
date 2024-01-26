import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:novelty/controllers/network_controller.dart';
import 'package:novelty/dependecy_injection.dart';
import 'package:novelty/screens/auth/login_screen.dart';
import 'package:novelty/screens/consumer/home_screen.dart';
import 'package:novelty/services/local_storage.dart';
import 'package:novelty/services/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: const AuthChecker(),
    );
  }
}

class AuthChecker extends StatefulWidget {
  const AuthChecker({super.key});

  @override
  State<AuthChecker> createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  @override
  void initState() {
    super.initState();

    Get.find<NetworkController>().firstCheck();
  }

  @override
  Widget build(BuildContext context) {
    return get() == null ? const LoginScreen() : const HomeScreen();
  }

  get() => Get.find<AuthService>().get();
}
