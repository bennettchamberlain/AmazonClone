import 'dart:ui';

import 'package:flutter/material.dart';

class PriceWidget extends StatelessWidget {
  final Color color;
  final double price;
  const PriceWidget({required this.color, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "\$",
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontFeatures: const [
              FontFeature.superscripts(),
            ],
          ),
        ),
        Text(
          price.toInt().toString(),
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          (price - price.toInt()).toString(),
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontFeatures: const [
              FontFeature.superscripts(),
            ],
          ),
        ),
      ],
    );
  }
}
