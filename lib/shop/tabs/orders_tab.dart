import 'package:flutter/material.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topPadding = MediaQuery.of(context).padding.top;
    return Column(
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
              'Buyurtmalar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
