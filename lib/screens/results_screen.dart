import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/widgets/loading_widget.dart';
import 'package:amazon_clone/widgets/results_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('products')
                  .where('productName', isEqualTo: query)
                  .get(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LoadingWidget();
                } else {
                  return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      ProductModel product = ProductModel.getModelFromJson(
                          json: snapshot.data!.docs[index].data());
                      return ResultsWidget(
                        product: product,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
