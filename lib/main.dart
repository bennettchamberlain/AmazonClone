import 'package:amazon_clone/layout/screen_layout.dart';
import 'package:amazon_clone/screens/product_screen.dart';
import 'package:amazon_clone/screens/signin_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'models/product_model.dart';
import 'screens/results_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {}
  runApp(const AmazonClone());
}

class AmazonClone extends StatelessWidget {
  const AmazonClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Amazon Clone",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot<User?> user) {
            if (user.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.orange),
              );
            } else if (user.hasData) {
              //FirebaseAuth.instance.signOut();
              //return const ScreenLayout();
              return ProductScreen(
                  product: ProductModel(
                      url:
                          'https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png',
                      productName: "Rick Astley",
                      price: 9999999,
                      discount: 0,
                      uid: "salkjdhfwr",
                      sellerName: "bennett",
                      sellerUid: "adshjfgka",
                      rating: 1,
                      numberOfRatings: 22));
            } else {
              return const SignInScreen();
            }
          }),
    );
  }
}
