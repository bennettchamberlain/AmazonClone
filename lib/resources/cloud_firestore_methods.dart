import 'dart:typed_data';

import 'package:amazon_clone/models/order_requests_model.dart';
import 'package:amazon_clone/models/product_model.dart';
import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../models/review_model.dart';

class CloudFirestoreMethods {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future uploadNameandAddressToDatabase(
      {required UserDetailsModel user}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .set(user.getJson());
  }

  Future getNameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    UserDetailsModel userModel =
        UserDetailsModel.getModelFromJson(snap.data() as dynamic);

    //print(userModel.getJson());
    return userModel;
  }

  Future<String> uploadProductToDatabse({
    required Uint8List? image,
    required String productName,
    required String rawCost,
    required int discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    String output = "Something went wrong";
    productName.trim();
    rawCost.trim();
    if (image != null && productName != "" && rawCost != "") {
      try {
        String uid = Utils().getUid();
        double cost = double.parse(rawCost);
        cost = cost - (cost * (discount / 100));
        String url = await uploadImageToDatabase(image: image, uid: uid);
        ProductModel product = ProductModel(
            url: url,
            productName: productName,
            price: cost,
            discount: discount,
            uid: uid,
            sellerName: sellerName,
            sellerUid: sellerUid,
            rating: 5,
            numberOfRatings: 0);
        await firebaseFirestore
            .collection("products")
            .doc(uid)
            .set(product.getJson());
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = 'Please fill out all the required fields';
    }
    return output;
  }

  Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
        FirebaseStorage.instance.ref().child("products").child(uid);
    UploadTask uploadTask = storageRef.putData(image);
    TaskSnapshot task = await uploadTask;
    return task.ref.getDownloadURL();
  }

  Future<List<Widget>> getProductsFromDiscount(int discount) async {
    List<Widget> children = [];
    QuerySnapshot<Map<String, dynamic>> snap = await firebaseFirestore
        .collection("products")
        .where("discount", isEqualTo: discount)
        .get();

    for (int i = 0; i < snap.docs.length; i++) {
      DocumentSnapshot docSnap = snap.docs[i];
      ProductModel model =
          ProductModel.getModelFromJson(json: (docSnap.data() as dynamic));
      children.add(SimpleProductWidget(productModel: model));
    }
    return children;
  }

  Future uploadReviewToDatabase(
      {required String productUid, required ReviewModel model}) async {
    await firebaseFirestore
        .collection("products")
        .doc(productUid)
        .collection("reviews")
        .add(model.getJson());

    await changeAverageRating(productUid: productUid, reviewModel: model);
  }

  Future addProductToCart({required ProductModel productModel}) async {
    await firebaseFirestore
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart")
        .doc(productModel.uid)
        .set(productModel.getJson());
  }

  Future deleteProductFromCart({required String uid}) async {
    firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection("cart")
        .doc(uid)
        .delete();
  }

  Future buyAllItemsInCart({required UserDetailsModel userDetails}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cart')
        .get();

    for (int i = 0; i < snapshot.docs.length; i++) {
      ProductModel model =
          ProductModel.getModelFromJson(json: snapshot.docs[i].data());
      addProductToOrders(model: model, userDetails: userDetails);
      await deleteProductFromCart(uid: model.uid);
    }
  }

  Future addProductToOrders(
      {required ProductModel model,
      required UserDetailsModel userDetails}) async {
    await firebaseFirestore
        .collection('users')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('orders')
        .add(model.getJson());
    await sendOrderRequest(model: model, userDetails: userDetails);
  }

  Future sendOrderRequest(
      {required ProductModel model,
      required UserDetailsModel userDetails}) async {
    OrderRequestModel orderRequestModel = OrderRequestModel(
        orderName: model.productName, buyersAddress: userDetails.address);
    await firebaseFirestore
        .collection('users')
        .doc(model.sellerUid)
        .collection('orderRequests')
        .add(orderRequestModel.getJson());
  }

  Future changeAverageRating(
      {required String productUid, required ReviewModel reviewModel}) async {
    DocumentSnapshot snapshot =
        await firebaseFirestore.collection('products').doc(productUid).get();
    ProductModel model =
        ProductModel.getModelFromJson(json: snapshot.data() as dynamic);
    int currentRating = model.rating;
    int newRating = (currentRating + reviewModel.rating / 2).toInt();
    await firebaseFirestore
        .collection('products')
        .doc(productUid)
        .update({"rating": newRating});
  }
}
