import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ProductShowcaseListview extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ProductShowcaseListview(
      {required this.title, required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    double height = screenSize.height / 4;
    double titleHeight = 25;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      height: height,
      width: screenSize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: titleHeight,
            child: Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(
                    "Show More",
                    style: TextStyle(color: activeCyanColor),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: height - (titleHeight + 26),
            width: screenSize.width,
            child:
                ListView(scrollDirection: Axis.horizontal, children: children),
          ),
        ],
      ),
    );
  }
}
