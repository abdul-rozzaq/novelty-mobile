import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/models/book_model.dart';

class CategoryTab extends StatefulWidget {
  const CategoryTab({super.key});

  @override
  State<CategoryTab> createState() => CategoryTabState();
}

class CategoryTabState extends State<CategoryTab> {
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
                'Janrlar',
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
              itemCount: controller.genres.length,
              itemBuilder: (context, index) {
                Genre genre = controller.genres[index];

                return InkWell(
                  onTap: () {},
                  onLongPress: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.withOpacity(.1),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BookGenreIcons.getIcon(genre.name),
                          size: 30,
                          color: Colors.blueAccent,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          genre.name,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          '${controller.booksCountByGenre(genre)} ta ',
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookGenreIcons {
  static IconData getIcon(String janr) {
    switch (janr.toLowerCase()) {
      case 'horror':
        return Icons.sentiment_very_dissatisfied;
      case 'tarixiy':
        return Icons.history;
      case 'fantastika':
        return Icons.local_florist;
      case 'adabiyot':
        return Icons.menu_book;
      case 'bolalar adabiyoti':
        return Icons.child_care;
      case 'biografiya':
        return Icons.person;
      case 'san\'at':
        return Icons.brush;
      case 'sayohat':
        return Icons.card_travel;
      case 'detektiv':
        return Icons.search;
      case 'qo\'llanma':
        return Icons.library_books;
      case 'din':
        return CupertinoIcons.moon_fill;
      case 'texnologiya':
        return Icons.devices;
      case 'komiks':
        return Icons.image;
      case 'she\'riyat':
        return Icons.vrpano;
      case 'psixologiya':
        return Icons.psychology;
      case 'komediya':
        return Icons.sentiment_very_satisfied_rounded;
      default:
        return Icons.book;
    }
  }
}
