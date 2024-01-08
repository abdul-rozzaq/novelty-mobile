import 'package:flutter/material.dart';

class IconX extends StatelessWidget {
  const IconX({
    super.key,
    required this.data,
  });

  final IconData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        data,
        size: 30,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
