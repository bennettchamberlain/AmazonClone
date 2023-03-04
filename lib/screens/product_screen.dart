import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/price_widget.dart';
import 'package:amazon_clone/widgets/review_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../models/review_model.dart';
import '../providers/user_details_provider.dart';
import '../utils/utils.dart';
import '../widgets/review_dialog.dart';

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
                                          style: const TextStyle(
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
                              color: Colors.orange,
                              isLoading: false,
                              onPressed: () async {
                                CloudFirestoreMethods().addProductToOrders(
                                    model: widget.product,
                                    userDetails:
                                        Provider.of<UserDetailsProvider>(
                                                context,
                                                listen: false)
                                            .userDetails);
                                Utils().showSnackBar(
                                    context: context,
                                    content: "Added to orders");
                              },
                              child: const Text("Buy Now",
                                  style: TextStyle(color: Colors.black))),
                          spaceThing,
                          CustomMainButton(
                              color: yellowColor,
                              isLoading: false,
                              onPressed: () async {
                                await CloudFirestoreMethods().addProductToCart(
                                    productModel: widget.product);
                                Utils().showSnackBar(
                                    context: context,
                                    content: "Added to cart.");
                              },
                              child: const Text("Add to Cart",
                                  style: TextStyle(color: Colors.black))),
                          spaceThing,
                          CustomSimpleRoundedButton(
                            onPressed: () {
                              showDialog(
                                  context: (context),
                                  builder: (context) {
                                    return ReviewDialog(
                                      productUid: widget.product.uid,
                                    );
                                  });
                            },
                            text: "Add a review for this product",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("products")
                            .doc(widget.product.uid)
                            .collection("reviews")
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container();
                          } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  ReviewModel model =
                                      ReviewModel.getModelFromJson(
                                          json: snapshot.data!.docs[index]
                                              .data());
                                  return ReviewWidget(review: model);
                                });
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            const UserDetailsBar(offset: 0),
          ],
        ),
      ),
    );
  }
}
