import 'package:flutter/material.dart';

class DrawerX extends StatefulWidget {
  const DrawerX({super.key});

  @override
  State<DrawerX> createState() => _DrawerXState();
}

class _DrawerXState extends State<DrawerX> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: size.height * .25,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/bg.jpg',
                  width: size.width,
                  fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(16),
                  child: const Text(
                    'asdasdasdasd',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
