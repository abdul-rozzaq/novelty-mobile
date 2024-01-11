import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novelty/components/buttons.dart';

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            RowButtonX(
              icon: Icons.person,
              label: 'Shaxsiy ma\'lumotlar',
            ),
            SizedBox(height: 15),
            RowButtonX(
              icon: Icons.translate,
              label: 'Ilova tili',
            ),
            SizedBox(height: 15),
            RowButtonX(
              icon: CupertinoIcons.moon_fill,
              label: 'Mavzu',
            ),
            SizedBox(height: 15),
            RowButtonX(
              icon: Icons.person_off_rounded,
              iconColor: Colors.red,
              labelColor: Colors.red,
              label: 'Profilni o\'chirish',
            ),
            SizedBox(height: 15),
            RowButtonX(
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
