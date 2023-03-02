import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/widgets/results_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final String query;
  const ResultsScreen({required this.query, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: true),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "Showing results for ",
                      style: TextStyle(fontSize: 17),
                    ),
                    TextSpan(
                      text: query,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 3,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return ResultsWidget(
                  product: ProductModel(
                    url:
                        'https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png',
                    productName:
                        "Rick Astley ahah fkfhcjdj ffjdkvkdkld f d vd f  d f df  f  df df  f  f kajdhslf adfdlhjka akfhlsdkabfaf asdjfahlajdsbj",
                    price: 9999999,
                    discount: 0,
                    uid: "salkjdhfwr",
                    sellerName: "bennett",
                    sellerUid: "adshjfgka",
                    rating: 2,
                    numberOfRatings: 22,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
