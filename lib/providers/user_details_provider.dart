import 'package:flutter/material.dart';

import '../models/user_details_model.dart';
import '../resources/cloud_firestore_methods.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;
  UserDetailsProvider()
      : userDetails = UserDetailsModel(name: "Loading", address: "Loading");

  Future getData() async {
    userDetails = await CloudFirestoreMethods().getNameAndAddress();
    notifyListeners();
  }
}
