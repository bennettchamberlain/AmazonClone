import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final int index;
  const CategoryWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(categoryLogos[index]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  categoriesList[index],
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
