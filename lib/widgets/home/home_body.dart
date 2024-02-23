import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_shop/widgets/products/product_cart.dart';

class HomeBody extends StatefulWidget {
  final double maxWidth;
  final double maxHeight;
  HomeBody({super.key, required this.maxWidth, required this.maxHeight});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final ScrollController controller = ScrollController();

  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    double mainAxisExtent = 480;
    return Padding(
      padding: widget.maxWidth > 1200
          ? EdgeInsets.symmetric(
              horizontal: widget.maxWidth * 0.15, vertical: 15)
          : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: widget.maxHeight / 3,
            constraints: const BoxConstraints(
              minHeight: 200,
            ),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage('assets/dog.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black.withOpacity(0.2)),
                  child: const Text(
                    'Find your your pet here',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withAlpha(120),
                    suffixIcon: Icon(
                      Icons.search_sharp,
                      size: 25,
                    ),
                    constraints: const BoxConstraints(
                        maxHeight: 40, minHeight: 30, maxWidth: 800),
                    hintText: 'Search dog, cat etc ...',
                    contentPadding:
                        const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
              },
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var item in items)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 150,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue,
                                image: const DecorationImage(
                                  image: AssetImage('assets/dog.jpg'),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.blue,
                            ),
                            child: const Center(
                              child: Text(
                                "Golden Friendly ... ",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending dogs',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: widget.maxWidth < 600
                            ? 1
                            : widget.maxWidth < 800
                                ? 2
                                : 3,
                        mainAxisExtent: mainAxisExtent,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15),
                    itemCount: 9,
                    itemBuilder: (context, i) {
                      return ProductCart();
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
