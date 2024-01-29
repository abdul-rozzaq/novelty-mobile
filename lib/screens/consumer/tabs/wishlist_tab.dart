import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/components/saved_books_widget.dart';
import 'package:novelty/controllers/app_controller.dart';

class WishListTab extends StatefulWidget {
  const WishListTab({super.key});

  @override
  State<WishListTab> createState() => _WishListTabState();
}

class _WishListTabState extends State<WishListTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double topPadding = MediaQuery.of(context).padding.top;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) => Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: topPadding + 15,
              bottom: topPadding / 2,
            ),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            width: size.width,
            child: const Center(
              child: Text(
                'Saqlangan kitoblar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(15).copyWith(bottom: bottomPadding),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 287, mainAxisSpacing: 15, crossAxisSpacing: 15),
              itemBuilder: (context, index) => SavedBook(book: controller.likedBooks[index]),
              itemCount: controller.likedBooks.length,
            ),
          )
        ],
      ),
    );
  }
}
