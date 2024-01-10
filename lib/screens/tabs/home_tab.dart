import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novelty/components/buttons.dart';
import 'package:novelty/screens/news_screen.dart';
import 'package:novelty/screens/search_screen.dart';
import 'package:novelty/screens/select_location_screen.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ScrollController scrollController = ScrollController();
  double radius = 15;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      setState(() {
        radius = scrollController.offset > 20 ? 0 : 15;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Column(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.only(
            bottom: size.width * .05,
            left: size.width * .05,
            right: size.width * .05,
            top: size.width * .03,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
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
                        onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => const SelectLocationScreen())),
                        child: const Row(
                          children: [
                            IconButtonX(icon: Icons.location_on),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sizning joylashuvingiz',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    'Buvayda',
                                    style: TextStyle(
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
          child: SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.only(bottom: bottomPadding + 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                CarouselSlider(
                  items: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(5)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(5)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(5)),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                  options: CarouselOptions(
                    viewportFraction: .8,
                    height: 170,
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
                    itemBuilder: (context, index) => const HBookWidget(),
                    itemCount: 20,
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
                    itemBuilder: (context, index) => const HBookWidget(),
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Tarixiy kitoblar',
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
                    itemBuilder: (context, index) => const HBookWidget(),
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class HBookWidget extends StatelessWidget {
  const HBookWidget({
    super.key,
  });

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
            width: 80,
            decoration: BoxDecoration(
              color: Colors.blueGrey[100],
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          const SizedBox(width: 5),
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Atom odatlar',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  'James Krill',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey),
                ),
                Text('asdasdad'),
                Text('asdasdad'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
