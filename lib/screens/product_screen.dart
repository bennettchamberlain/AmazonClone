import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/product_model.dart';
import '../utils/utils.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel product;
  const ProductScreen({required this.product, super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThing = Expanded(child: Container());
  Size screenSize = Utils().getScreenSize();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SearchBarWidget(
          isReadOnly: true,
          hasBackButton: true,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height -
                          (kAppBarHeight + (kAppBarHeight / 2)),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: kAppBarHeight / 2,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 5.0),
                                      child: Text(widget.product.sellerName,
                                          style: TextStyle(
                                              color: activeCyanColor,
                                              fontSize: 16)),
                                    ),
                                    Text(widget.product.productName)
                                  ],
                                ),
                                RatingStarWidget(rating: widget.product.rating)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              height: screenSize.height / 3,
                              constraints: BoxConstraints(
                                  maxHeight: screenSize.height / 3),
                              child: Image.network(widget.product.url),
                            ),
                          ),
                          spaceThing,
                          PriceWidget(
                              color: Colors.black, price: widget.product.price),
                          spaceThing,
                          CustomMainButton(
                              child: Text("Buy Now",
                                  style: TextStyle(color: Colors.black)),
                              color: Colors.orange,
                              isLoading: false,
                              onPressed: () {}),
                          spaceThing,
                          CustomMainButton(
                              child: Text("Add to Cart",
                                  style: TextStyle(color: Colors.black)),
                              color: yellowColor,
                              isLoading: false,
                              onPressed: () {}),
                          spaceThing,
                          CustomSimpleRoundedButton(
                            onPressed: () {},
                            text: "Add a review for this product",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height)
                  ],
                ),
              ),
            ),
            UserDetailsBar(
                userDetails:
                    UserDetailsModel(name: 'bennett', address: '377 central'),
                offset: 0),
          ],
        ),
      ),
    );
  }
}
