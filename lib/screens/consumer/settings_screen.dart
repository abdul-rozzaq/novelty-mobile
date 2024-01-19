import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/screens/auth/login_screen.dart';
import 'package:novelty/services/local_storage.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData().copyWith(color: Colors.black),
        title: const Text(
          'Sozlamalar',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const RowButtonX(
              icon: Icons.person,
              label: 'Shaxsiy ma\'lumotlar',
            ),
            const SizedBox(height: 15),
            const RowButtonX(
              icon: Icons.translate,
              label: 'Ilova tili',
            ),
            const SizedBox(height: 15),
            const RowButtonX(
              icon: CupertinoIcons.moon_fill,
              label: 'Mavzu',
            ),
            const SizedBox(height: 15),
            const RowButtonX(
              icon: Icons.person_off_rounded,
              iconColor: Colors.red,
              labelColor: Colors.red,
              label: 'Profilni o\'chirish',
            ),
            const SizedBox(height: 15),
            RowButtonX(
              onTap: () {
                Get.find<AuthService>().delete();
                Get.find<UserService>().delete();

                // Get.find<AppController>().loadUser();

                Get.offAll(() => const LoginScreen());
              },
              icon: Icons.logout_outlined,
              iconColor: Colors.red,
              labelColor: Colors.red,
              label: 'Chiqish',
            ),
          ],
        ),
      ),
    );
  }
}
