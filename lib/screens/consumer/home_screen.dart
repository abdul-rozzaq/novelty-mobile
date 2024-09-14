// ignore_for_file: use_build_context_synchronously

import 'package:barcode_scan2/platform_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/screens/consumer/search_screen.dart';
import 'package:novelty/screens/consumer/tabs/category_tab.dart';
import 'package:novelty/screens/consumer/tabs/home_tab.dart';
import 'package:novelty/screens/consumer/tabs/profile_tab.dart';
import 'package:novelty/screens/consumer/tabs/wishlist_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarIconBrightness: Brightness.light));

    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBody: true,
      body: IndexedStack(
        index: pageIndex,
        children: const [
          HomeTab(),
          CategoryTab(),
          WishListTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: size.height * .08,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButtonY(
              icon: Icons.home_rounded,
              isActive: pageIndex == 0,
              label: 'Uy',
              callback: () => setState(() => pageIndex = 0),
            ),
            IconButtonY(
              icon: Icons.category_rounded,
              isActive: pageIndex == 1,
              label: 'Katalog',
              callback: () => setState(() => pageIndex = 1),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Transform.scale(
                scale: 1.40,
                child: InkWell(
                  onTap: () async {
                    var result = await BarcodeScanner.scan();

                    if (result.rawContent != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                            isbn: result.rawContent,
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.3),
                          offset: const Offset(0, 4),
                          blurRadius: 15,
                        )
                      ],
                      color: Colors.blueGrey[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.qr_code_scanner_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IconButtonY(
              icon: Icons.favorite,
              isActive: pageIndex == 2,
              label: 'Saqlangan',
              callback: () => setState(() => pageIndex = 2),
            ),
            IconButtonY(
              icon: Icons.person,
              isActive: pageIndex == 3,
              label: 'Profil',
              callback: () => setState(() => pageIndex = 3),
            ),
          ],
        ),
      ),
    );
  }
}
