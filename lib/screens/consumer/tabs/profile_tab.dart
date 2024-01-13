import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/models/user_model.dart';
import 'package:novelty/screens/consumer/settings_screen.dart';
import 'package:novelty/screens/shop/home_screen.dart';
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Container(
                //         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                //         decoration: BoxDecoration(
                //           color: Colors.transparent,
                //           borderRadius: BorderRadius.circular(10),
                //           border: Border.all(
                //             width: 1,
                //             color: Colors.grey[300]!,
                //           ),
                //         ),
                //         child: const Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'Jarayonda',
                //               style: TextStyle(fontSize: 10, color: Colors.grey),
                //             ),
                //             Text(
                //               '0 so\'m',
                //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //     const SizedBox(width: 20),
                //     Expanded(
                //       child: Container(
                //         padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                //         decoration: BoxDecoration(
                //           color: Colors.black,
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child: const Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'Keshbek balansi',
                //               style: TextStyle(fontSize: 10, color: Colors.white),
                //             ),
                //             Text(
                //               '0 so\'m',
                //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 20),
                RowButtonX(
                  // onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const HomeScreen())),
                  onTap: () => Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const HomeScreen()), (route) => false),
                  icon: Icons.shopping_basket_rounded,
                  label: 'Do\'kon bo\'limi',
                ),
                const SizedBox(height: 10),
                RowButtonX(
                  onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const SettingsScreen())),
                  icon: Icons.settings_rounded,
                  label: 'Settings',
                ),
                const SizedBox(height: 10),
                const RowButtonX(
                  icon: Icons.credit_card,
                  label: 'Keshbek',
                ),
                const SizedBox(height: 10),
                const RowButtonX(
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
