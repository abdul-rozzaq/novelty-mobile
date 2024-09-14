import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:novelty/models/book_model.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key, required this.book});

  final Book book;

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Ko\'proq'),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        padding: const EdgeInsets.all(10),
        child: const Center(
          child: Text(
            'Savatga qo\'shish',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(offset: Offset(0, 3), blurRadius: 3, color: Color.fromARGB(50, 0, 0, 0)),
                    ],
                    color: Colors.white,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: widget.book.images[0][2],
                      height: size.width * .55,
                      width: size.width * .4,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        '( 65 ta sharx )',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue, size: 15),
                          Icon(Icons.star, color: Colors.blue, size: 15),
                          Icon(Icons.star, color: Colors.blue, size: 15),
                          Icon(Icons.star, color: Colors.blue, size: 15),
                          Icon(Icons.star, color: Colors.grey, size: 15),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.book.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.book.author,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${widget.book.price} so\'m',
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      const Text('12 ta dona')
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Kitob haqida',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(widget.book.description),
            const SizedBox(height: 8),
            const Text(
              'Janrlar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 4,
              runSpacing: 2,
              children: widget.book.genres
                  .map<Widget>((e) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(e.name),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
