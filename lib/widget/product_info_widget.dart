import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widget/price_widget.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ProducInformationWidget extends StatelessWidget {
  final String productName;
  final double price;
  final String sellerName;
  const ProducInformationWidget(
      {required this.price,
      required this.productName,
      required this.sellerName,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              productName,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                letterSpacing: 0.9,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: PriceWidget(color: Colors.black, price: price),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: "Sold by ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                TextSpan(
                  text: sellerName,
                  style: TextStyle(color: activeCyanColor, fontSize: 14),
                )
              ])),
            )
          ],
        ),
      ),
    );
  }
}
