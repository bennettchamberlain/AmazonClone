import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CloudFirestoreMethods cloudFirestoreMethods = CloudFirestoreMethods();
  Future<String> signUpUser(
      {required String name,
      required String address,
      required String email,
      required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong.";
    if (name != "" && address != "" && password != "" && email != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user = UserDetailsModel(name: name, address: address);
        await cloudFirestoreMethods.uploadNameandAddressToDatabase(user: user);
        output = 'Success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill in each field";
    }
    return output;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something went wrong.";
    if (password != "" && email != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = 'Success';
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill in each field";
    }
    return output;
  }
}
