class ProductModel {
  final String url;
  final String productName;
  final double price;
  final int discount;
  final String uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int numberOfRatings;
  ProductModel({
    required this.url,
    required this.productName,
    required this.price,
    required this.discount,
    required this.uid,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.numberOfRatings,
  });

  Map<String, dynamic> getJson() {
    return {
      'url': url,
      'productName': productName,
      'cost': price,
      'discount': discount,
      'uid': uid,
      'sellerName': sellerName,
      'sellerUid': sellerUid,
      'rating': rating,
      'noOfRating': numberOfRatings
    };
  }

  factory ProductModel.getModelFromJson({required Map<String, dynamic> json}) {
    return ProductModel(
        url: json['url'],
        productName: json['productName'],
        price: json['cost'],
        discount: json['discount'],
        uid: json['uid'],
        sellerName: json['sellerName'],
        sellerUid: json['sellerUid'],
        rating: json['rating'],
        numberOfRatings: json['noOfRating']);
  }
}
