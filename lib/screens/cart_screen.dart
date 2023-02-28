import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widget/cart_item_widget.dart';
import 'package:amazon_clone/widget/search_bar_widget.dart';
import 'package:amazon_clone/widget/user_details_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          children: [
            UserDetailsBar(
                userDetails: UserDetailsModel(address: "hello", name: 'benne'),
                offset: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomMainButton(
                  child: Text("proceed to buy (n) items",
                      style: TextStyle(color: Colors.black)),
                  color: yellowColor,
                  isLoading: false,
                  onPressed: () {}),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return CartItemWidget();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
