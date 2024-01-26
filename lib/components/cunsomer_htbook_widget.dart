import 'package:flutter/material.dart';

class HBookWidget extends StatefulWidget {
  const HBookWidget({super.key});

  @override
  State<HBookWidget> createState() => HBookWidgetState();
}

class HBookWidgetState extends State<HBookWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(left: 10),
      width: 230,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 85,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'lorem ipsum dolor sit amet, consectetur adipiscing',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(height: 3),
                Text(
                  'James Krill',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text('35.000 so\'m'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
