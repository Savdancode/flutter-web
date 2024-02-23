import 'dart:ui';

import 'package:flutter/material.dart';
import '../models/ButtonModel.dart';
import '../widgets/home/home_body.dart';
import '../widgets/home/home_header.dart';
import '../widgets/products/product_cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ButtonModel> listMenu = [
    ButtonModel(
      title: "Home",
      titleColor: Colors.black87,
      backGroundColor: Colors.cyan,
    ),
    ButtonModel(
      title: "Shop",
      titleColor: Colors.black87,
      backGroundColor: Colors.cyan,
    ),
    ButtonModel(
      title: "About Us",
      titleColor: Colors.black87,
      backGroundColor: Colors.cyan,
    ),
  ];
  final List<String> items = List.generate(20, (index) => "Item ${index + 1}");
  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      key: _scaffoldKey,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        title: 'Pu Heng Shop',
        backGroundColor: Colors.cyan,
        listAction: listMenu,
        maxWidth: maxWidth,
        context: context,
      ),
      endDrawer: Drawer(
        // Your drawer content goes here
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
        child: ListView(
            padding: const EdgeInsets.only(top: 20),
            children: listMenu
                .map((item) => MaterialButton(
                      onPressed: () {},
                      shape: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ))
                .toList()),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
          },
        ),
        child: ListView(
          // physics: NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: maxWidth > 1200
                  ? EdgeInsets.symmetric(
                      horizontal: maxWidth * 0.15, vertical: 15)
                  : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: maxHeight / 3,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
                            contentPadding: const EdgeInsets.only(
                                bottom: 10, left: 10, right: 10),
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
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
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: maxWidth < 600
                                        ? 1
                                        : maxWidth < 800
                                            ? 2
                                            : 3,
                                    mainAxisExtent: 480,
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
            ),
            Container(
              padding: maxWidth > 1200
                  ? EdgeInsets.symmetric(
                      horizontal: maxWidth * 0.15, vertical: 15)
                  : const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              color: Colors.green,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Us",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Name : Sim Layheng",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Sex : Female",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Mobile : +85598421983",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mobile Legend",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Name : Heng Winter",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Heros : Yuzhong, Terizla, Nana, Vexana",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Role : Mutiple",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Favourite",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Name : Sim Layheng",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Sex : Female",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Mobile : +85598421983",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
