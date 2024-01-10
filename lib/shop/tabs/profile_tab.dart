import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/screens/settings_screen.dart';
import 'package:novelty/shop/home_screen.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: topPadding + 15,
            bottom: topPadding / 2,
          ),
          decoration: const BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
          ),
          width: size.width,
          child: const Center(
            child: Text(
              'Mening profilim',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
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
                        color: Colors.teal.withOpacity(.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'Ziyo Nur Savdo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                RowButtonY(
                  onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const HomeScreen())),
                  // onTap: () => Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const HomeScreen()), (route) => false),
                  icon: Icons.shopping_basket_rounded,
                  label: 'Haridor bo\'limi',
                ),
                const SizedBox(height: 10),
                RowButtonY(
                  onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const SettingsScreen())),
                  icon: Icons.settings_rounded,
                  label: 'Settings',
                ),
                const SizedBox(height: 10),
                const RowButtonY(
                  icon: Icons.credit_card,
                  label: 'Keshbek',
                ),
                const SizedBox(height: 10),
                const RowButtonY(
                  icon: Icons.info,
                  label: 'Ilova haqida',
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: bottomPadding),
      ],
    );
  }
}
