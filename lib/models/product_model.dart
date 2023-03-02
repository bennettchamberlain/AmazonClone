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
}
