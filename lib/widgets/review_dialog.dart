import 'package:amazon_clone/models/review_model.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../providers/user_details_provider.dart';

class ReviewDialog extends StatelessWidget {
  final String productUid;
  const ReviewDialog({required this.productUid, super.key});

  @override
  Widget build(BuildContext context) {
    return RatingDialog(
      // your app's name?
      title: const Text(
        'Leave a review for this product',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),

      submitButtonText: 'Send',
      commentHint: 'Type here',

      onSubmitted: (RatingDialogResponse response) async {
        CloudFirestoreMethods().uploadReviewToDatabase(
            productUid: productUid,
            model: ReviewModel(
                senderName:
                    Provider.of<UserDetailsProvider>(context, listen: false)
                        .userDetails
                        .name,
                description: response.comment,
                rating: response.rating.toInt()));
      },
    );
  }
}
