import 'package:flutter/material.dart';

void main() {
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Amazon Clone",
        debugShowCheckedModeBanner: false,
        home: Text("himom"));
  }
}
