import 'package:flutter/material.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/screens/shop/tabs/home_tab.dart';
import 'package:novelty/screens/shop/tabs/profile_tab.dart';
import 'package:novelty/screens/shop/tabs/collections_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: IndexedStack(
        index: pageIndex,
        children: const [
          HomeTab(),
          CollectionsTab(),
          ProfileTab(),
        ],
      ),
      floatingActionButton: pageIndex != 2
          ? FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {},
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            )
          : null,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: size.height * .08,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButtonZ(
              icon: Icons.home_rounded,
              isActive: pageIndex == 0,
              label: 'Uy',
              callback: () => setState(() => pageIndex = 0),
            ),
            IconButtonZ(
              icon: Icons.collections_bookmark_rounded,
              isActive: pageIndex == 1,
              label: 'To\'plam',
              callback: () => setState(() => pageIndex = 1),
            ),
            IconButtonZ(
              icon: Icons.person,
              isActive: pageIndex == 2,
              label: 'Profil',
              callback: () => setState(() => pageIndex = 2),
            ),
          ],
        ),
      ),
    );
  }
}

class CardBookWidget extends StatelessWidget {
  const CardBookWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 3),
            blurRadius: 3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/bg.jpg',
              width: double.maxFinite,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Ikki eshik orasi',
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
