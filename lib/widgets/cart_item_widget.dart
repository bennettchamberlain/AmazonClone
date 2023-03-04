import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/product_quantity_button.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/product_info_widget.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../screens/product_screen.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Container(
      padding: const EdgeInsets.all(25),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductScreen(product: product)),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenSize.width / 3,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Center(
                        child: Image.network(product.url),
                      ),
                    ),
                  ),
                  ProductInfoWidget(
                    productName: product.productName,
                    price: product.price,
                    sellerName: product.sellerName,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                ProductQuantityButton(
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 40,
                    child: const Icon(Icons.remove)),
                ProductQuantityButton(
                    onPressed: () {},
                    color: Colors.white,
                    dimension: 40,
                    child: const Text(
                      "0",
                      style: TextStyle(
                        color: activeCyanColor,
                      ),
                    )),
                ProductQuantityButton(
                  onPressed: () async {
                    await CloudFirestoreMethods().addProductToCart(
                        productModel: ProductModel(
                            url: product.url,
                            productName: product.productName,
                            price: product.price,
                            discount: product.discount,
                            uid: Utils().getUid(),
                            sellerName: product.sellerName,
                            sellerUid: product.sellerUid,
                            rating: product.rating,
                            numberOfRatings: product.numberOfRatings));
                  },
                  color: backgroundColor,
                  dimension: 40,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      CustomSimpleRoundedButton(
                          onPressed: () async {
                            CloudFirestoreMethods()
                                .deleteProductFromCart(uid: product.uid);
                          },
                          text: "Delete"),
                      const SizedBox(
                        width: 5,
                      ),
                      CustomSimpleRoundedButton(
                          onPressed: () {}, text: "Save for later")
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "See more like this",
                        style: TextStyle(color: activeCyanColor, fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
