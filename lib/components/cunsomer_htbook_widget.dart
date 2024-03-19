import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/models/book_model.dart';
import 'package:novelty/screens/consumer/book_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class HBookWidget extends StatefulWidget {
  const HBookWidget({super.key, required this.book});

  final Book book;

  @override
  State<HBookWidget> createState() => HBookWidgetState();
}

class HBookWidgetState extends State<HBookWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) => InkWell(
        onTap: () => Get.to(BookDetailScreen(book: widget.book)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 10),
          width: 200,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: widget.book.images[0][3],
                      height: double.maxFinite,
                      fit: BoxFit.cover,
                      width: 85,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.book.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(height: 3),
                        const Text(
                          'James Krill',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        Text('${widget.book.price} so\'m'),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: () => controller.addLikeToBook(widget.book.id),
                  child: Icon(
                    controller.likedBooksIds.contains(widget.book.id) ? Icons.favorite : Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HBookWidgetSkeleton extends StatelessWidget {
  const HBookWidgetSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(left: 10),
        width: 200,
        color: Colors.grey[300],
      ),
    );
  }
}

class SkeletonAnimation extends StatelessWidget {
  final Widget child;

  const SkeletonAnimation({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}
