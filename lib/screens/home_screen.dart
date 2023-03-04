import 'package:amazon_clone/resources/cloud_firestore_methods.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/loading_widget.dart';
import 'package:amazon_clone/widgets/product_showcase_listview_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/user_details_bar.dart';
import 'package:flutter/material.dart';
import '../widgets/categories_horizontal_listview_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  double offset = 0;
  List<Widget>? discount70;
  List<Widget>? discount60;
  List<Widget>? discount50;
  List<Widget>? discount0;

  @override
  void initState() {
    super.initState();
    getData();
    scrollController.addListener(() {
      setState(() {
        offset = scrollController.position.pixels;
        //print(scrollController.position.pixels);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void getData() async {
    List<Widget> temp70 =
        await CloudFirestoreMethods().getProductsFromDiscount(70);
    List<Widget> temp60 =
        await CloudFirestoreMethods().getProductsFromDiscount(60);
    List<Widget> temp50 =
        await CloudFirestoreMethods().getProductsFromDiscount(50);
    List<Widget> temp0 =
        await CloudFirestoreMethods().getProductsFromDiscount(0);
    //print('$temp50 $temp60 $temp70 $temp0');
    setState(() {
      discount70 = temp70;
      discount60 = temp60;
      discount50 = temp50;
      discount0 = temp0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: false),
      body: discount70 != null &&
              discount60 != null &&
              discount50 != null &&
              discount0 != null
          ? Stack(
              children: [
                SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      const SizedBox(height: kAppBarHeight / 2),
                      const CategoriesHorizontalListView(),
                      const BannerAdWidget(),
                      ProductShowcaseListview(
                        title: "Up to 70% off",
                        children: discount70!,
                      ),
                      ProductShowcaseListview(
                        title: "Up to 60% off",
                        children: discount60!,
                      ),
                      ProductShowcaseListview(
                        title: "Up to 50% off",
                        children: discount50!,
                      ),
                      ProductShowcaseListview(
                        title: "Explore",
                        children: discount0!,
                      )
                    ],
                  ),
                ),
                UserDetailsBar(
                  offset: offset,
                ),
              ],
            )
          : const LoadingWidget(),
    );
  }
}
