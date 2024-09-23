import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/models/user_model.dart';
import 'package:novelty/screens/consumer/settings_screen.dart';
import 'package:novelty/services/local_storage.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => ProfileTabState();
}

class ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    User user = Get.find<UserService>().get();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: topPadding + 15,
            bottom: topPadding / 2,
          ),
          decoration: const BoxDecoration(
            color: Colors.blueAccent,
          ),
          width: size.width,
          child: const Center(child: Text('Mening profilim', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white))),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.person,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      user.getFullName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                RowButtonX(onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const SettingsScreen())), icon: Icons.settings_rounded, label: 'Settings'),
                const SizedBox(height: 10),
                const RowButtonX(icon: Icons.credit_card, label: 'Keshbek'),
                const SizedBox(height: 10),
                const RowButtonX(icon: Icons.info, label: 'Ilova haqida'),
              ],
            ),
          ),
        ),
        SizedBox(height: bottomPadding),
      ],
    );
  }
}
