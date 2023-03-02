import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/cart_item_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../models/user_details_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: true, hasBackButton: false),
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomMainButton(
                      child: Text("proceed to buy (n) items",
                          style: TextStyle(color: Colors.black)),
                      color: yellowColor,
                      isLoading: false,
                      onPressed: () {}),
                ),
                Divider(height: 1),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        product: ProductModel(
                            url:
                                'https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png',
                            productName: "Rick Astley",
                            price: 9999999,
                            discount: 0,
                            uid: "salkjdhfwr",
                            sellerName: "bennett",
                            sellerUid: "adshjfgka",
                            rating: 1,
                            numberOfRatings: 22),
                      );
                    },
                  ),
                )
              ],
            ),
            UserDetailsBar(
                userDetails: UserDetailsModel(address: "hello", name: 'benne'),
                offset: 0)
          ],
        ),
      ),
    );
  }
}
