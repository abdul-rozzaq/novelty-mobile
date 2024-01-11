import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double topPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Column(
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
          child: GridView.builder(
            padding: const EdgeInsets.all(15).copyWith(bottom: bottomPadding),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 100,
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: 10,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                onLongPress: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.withOpacity(.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Roman',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '18 ta',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
