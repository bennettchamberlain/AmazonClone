import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../screens/product_screen.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const SimpleProductWidget({required this.productModel, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductScreen(product: productModel)));
      },
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(productModel.url),
            )),
      ),
    );
  }
}
