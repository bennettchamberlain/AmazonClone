import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widget/product_info_widget.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 3,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                          'https://i.insider.com/626aa6a17f0c1c001890584a?width=1000&format=jpeg&auto=webp'),
                    ),
                  ),
                  ProducInformationWidget(
                      price: 200.3,
                      productName: "Large air mat with fire dragon",
                      sellerName: "rick")
                ],
              ),
              flex: 5),
          Expanded(child: Container(color: Colors.green), flex: 1),
          Expanded(child: Container(color: Colors.blue), flex: 1)
        ],
      ),
    );
  }
}
