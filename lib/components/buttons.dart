import 'package:flutter/material.dart';

class IconButtonX extends StatelessWidget {
  const IconButtonX({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class IconButtonY extends StatelessWidget {
  const IconButtonY({super.key, required this.icon, required this.isActive, required this.label, required this.callback});

  final IconData icon;
  final bool isActive;
  final String label;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: callback,
      child: Container(
        width: size.width * .17,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: isActive ? Colors.blueAccent : Colors.grey[400]),
            Text(
              label,
              style: TextStyle(fontSize: 10, color: isActive ? Colors.blueAccent : Colors.grey[400]),
            ),
          ],
        ),
      ),
    );
  }
}

class RowButtonX extends StatelessWidget {
  const RowButtonX({super.key, required this.icon, required this.label, this.onTap, this.iconColor = Colors.blueGrey, this.labelColor = Colors.black});

  final Function()? onTap;
  final String label;
  final IconData icon;
  final Color iconColor;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 25,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: labelColor),
            ),
          ),
          const SizedBox(width: 15),
          const Icon(
            Icons.chevron_right_outlined,
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
