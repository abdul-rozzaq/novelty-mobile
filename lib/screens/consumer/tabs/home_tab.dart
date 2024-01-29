import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/components/cunsomer_htbook_widget.dart';
import 'package:novelty/models/book_model.dart';
import 'package:novelty/screens/consumer/news_screen.dart';
import 'package:novelty/screens/consumer/search_screen.dart';
import 'package:novelty/screens/consumer/select_location_screen.dart';
import 'package:novelty/controllers/app_controller.dart';
import 'package:novelty/services/requests.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) => Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              bottom: size.width * .05,
              left: size.width * .05,
              right: size.width * .05,
              top: size.width * .03,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () => Get.to(() => const SelectLocationScreen()),
                          child: Row(
                            children: [
                              const IconButtonX(icon: Icons.location_on),
                              const SizedBox(width: 15),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sizning joylashuvingiz',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    // if (controller.user.districtId != null)
                                    Text(
                                      controller.district != null ? controller.district!.name : 'Tanlanmagan',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      InkWell(
                        onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const NewsScreen())),
                        child: const IconButtonX(icon: Icons.newspaper_outlined),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size.width * .85,
                    child: const Text(
                      'Kitob do\'konlaridan izlash',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen())),
                    child: Container(
                      width: size.width * .85,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey),
                          SizedBox(width: 8),
                          Text('Kitob nomi', style: TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => controller.loadBooks(),
              child: SingleChildScrollView(
                controller: scrollController,
                padding: EdgeInsets.only(bottom: bottomPadding + 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    CarouselSlider(
                      items: controller.isCarouselLoaded
                          ? controller.carousel
                              .map(
                                (e) => Container(
                                  width: double.maxFinite,
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: Requests.domain + e,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                              .toList()
                          : [
                              Container(
                                width: double.maxFinite,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              )
                            ],
                      options: CarouselOptions(
                        viewportFraction: .9,
                        height: 180,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Ommabob kitoblar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        shrinkWrap: true,
                        itemBuilder: controller.isBookLoaded
                            ? (context, index) {
                                Book book = controller.popularBooks[index];

                                return HBookWidget(book: book);
                              }
                            : (context, index) => const HBookWidgetSkeleton(),
                        itemCount: controller.isBookLoaded ? controller.popularBooks.length : 20,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Ilmiy kitoblar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 130,
                      child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                        shrinkWrap: true,
                        itemBuilder: controller.isBookLoaded
                            ? (context, index) {
                                Book book = controller.scientificBooks[index];

                                return HBookWidget(book: book);
                              }
                            : (context, index) => const HBookWidgetSkeleton(),
                        itemCount: controller.isBookLoaded ? controller.popularBooks.length : 20,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
