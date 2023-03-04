import 'package:amazon_clone/screens/product_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/widgets/price_widget.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../utils/utils.dart';

class ResultsWidget extends StatelessWidget {
  final ProductModel product;
  const ResultsWidget({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ProductScreen(product: product)),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screensize.width / 3,
              child: Image.network(product.url),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                product.productName,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Row(
                children: [
                  SizedBox(
                    width: screensize.width / 5,
                    child: FittedBox(
                      child: RatingStarWidget(rating: product.rating),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      product.numberOfRatings.toString(),
                      style: const TextStyle(color: activeCyanColor),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
                height: 20,
                child: FittedBox(
                    child:
                        PriceWidget(color: Colors.red, price: product.price)))
          ],
        ),
      ),
    );
  }
}
