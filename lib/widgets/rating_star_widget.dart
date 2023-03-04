import 'package:flutter/material.dart';

class RatingStarWidget extends StatelessWidget {
  final int rating;
  const RatingStarWidget({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < 5; i++) {
      children.add(
        i < rating
            ? const Icon(Icons.star, color: Colors.orange)
            : const Icon(Icons.star_outline, color: Colors.orange),
      );
    }
    return Row(
      children: children,
    );
  }
}
