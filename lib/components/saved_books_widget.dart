import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/models/book_model.dart';

class SavedBook extends StatelessWidget {
  const SavedBook({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.grey[50],
        ),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: CachedNetworkImage(imageUrl: book.image[2], width: double.maxFinite, height: 200, fit: BoxFit.cover),
                ),
                const SizedBox(height: 2),
                Text(
                  book.name,
                  style: const TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  book.author,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  '${book.price} so\'m',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
            Positioned(
              top: 4,
              right: 4,
              child: InkWell(
                onTap: () => controller.addLikeToBook(book.id),
                child: Icon(
                  controller.likedBooksIds.contains(book.id) ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
