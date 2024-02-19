import 'package:flutter/material.dart';
import '../models/ButtonModel.dart';
import '../widgets/home/home_body.dart';
import '../widgets/home/home_header.dart';

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
      body: HomeBody(
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      ),
    );
  }
}
