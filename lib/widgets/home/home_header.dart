import 'package:flutter/material.dart';

import '../../models/ButtonModel.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    final String title = "",
    Color? backGroundColor,
    required BuildContext context,
    required double maxWidth,
    required GlobalKey<ScaffoldState>? scaffoldKey,
    List<ButtonModel>? listAction,
  }) : super(
            title: Row(
              children: [
                SizedBox(
                  width: maxWidth > 1200 ? maxWidth * 0.15 : 0,
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/kaiheng.jpeg'),
                      )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            backgroundColor: backGroundColor,
            actions: maxWidth > 600
                ? listAction!
                    .map((item) => Padding(
                          padding: maxWidth > 1200 && item == listAction.last
                              ? EdgeInsets.only(right: maxWidth * 0.15)
                              : EdgeInsets.zero,
                          child: _menuItem(context, button: item),
                        ))
                    .toList()
                : [
                    IconButton(
                      onPressed: () {
                        scaffoldKey!.currentState?.openEndDrawer();
                      },
                      icon: const Icon(
                        Icons.line_weight_outlined,
                      ),
                    )
                  ]);
}

Widget _menuItem(BuildContext context, {required ButtonModel button}) {
  return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: StatefulBuilder(
        builder: (context, StateSetter setState) {
          return MouseRegion(
            onExit: (_) {
              setState(() {
                button.titleColor = Colors.black87;
              });
            },
            onEnter: (_) {
              setState(() {
                button.titleColor = Colors.white;
              });
            },
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 15),
                ),
                backgroundColor: MaterialStateProperty.all(
                    button.backGroundColor!.withAlpha(0)),
                overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    return Colors.cyan[700]!; // Change splash color here
                  },
                ),
              ),
              child: Text(
                button.title,
                style: TextStyle(
                  fontSize: 16,
                  color: button.titleColor,
                ),
              ),
            ),
          );
        },
      ));
}
