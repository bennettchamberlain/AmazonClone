import 'package:amazon_clone/models/user_details_model.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/product_showcase_listview_widget.dart';
import 'package:amazon_clone/widgets/search_bar_widget.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
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

  @override
  void initState() {
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(isReadOnly: false, hasBackButton: false),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(height: kAppBarHeight / 2),
                CategoriesHorizontalListView(),
                BannerAdWidget(),
                ProductShowcaseListview(
                    title: "Up to 70% off", children: testChildren),
                ProductShowcaseListview(
                  title: "Up to 60% off",
                  children: testChildren,
                ),
                ProductShowcaseListview(
                  title: "Up to 50% off",
                  children: testChildren,
                ),
                ProductShowcaseListview(
                  title: "Explore",
                  children: testChildren,
                )
              ],
            ),
          ),
          UserDetailsBar(
            offset: offset,
            userDetails: UserDetailsModel(
              name: "bennett",
              address: "377 central avve",
            ),
          ),
        ],
      ),
    );
  }
}
