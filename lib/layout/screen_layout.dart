import 'package:amazon_clone/utils/color_themes.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ScreenLayout extends StatefulWidget {
  const ScreenLayout({super.key});

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  changePage(int page) {
    pageController.jumpToPage(page);
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            controller: pageController,
            children: screens,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey[400]!, width: 1),
              ),
            ),
            child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: activeCyanColor, width: 4),
                  ),
                ),
                onTap: changePage,
                tabs: [
                  Tab(
                    child: Icon(Icons.home_outlined,
                        color:
                            currentPage == 0 ? activeCyanColor : Colors.black),
                  ),
                  Tab(
                    child: Icon(Icons.supervised_user_circle_outlined,
                        color:
                            currentPage == 1 ? activeCyanColor : Colors.black),
                  ),
                  Tab(
                    child: Icon(Icons.shopping_cart_checkout_outlined,
                        color:
                            currentPage == 2 ? activeCyanColor : Colors.black),
                  ),
                  Tab(
                    child: Icon(Icons.menu_outlined,
                        color:
                            currentPage == 3 ? activeCyanColor : Colors.black),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
