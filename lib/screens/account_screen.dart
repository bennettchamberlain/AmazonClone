import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widget/account_screen_appbar.dart';
import 'package:amazon_clone/widget/custom_main_button.dart';
import 'package:amazon_clone/widget/product_showcase_listview_widget.dart';
import 'package:flutter/material.dart';
import '../utils/color_themes.dart';
import '../utils/utils.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AccountScreenAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              const IntroAccountWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child:
                        Text("Sign In", style: TextStyle(color: Colors.black)),
                    color: Colors.orange,
                    isLoading: false,
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomMainButton(
                    child: Text("Sell", style: TextStyle(color: Colors.black)),
                    color: yellowColor,
                    isLoading: false,
                    onPressed: () {}),
              ),
              ProductShowcaseListview(
                title: "Your Orders",
                children: testChildren,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Order Requests',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        "Order: Black shoe",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text("Address: somewhere"),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.check),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroAccountWidget extends StatelessWidget {
  const IntroAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.0000000001)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: TextStyle(color: Colors.grey[800], fontSize: 27),
                    ),
                    TextSpan(
                        text: "Bennett ",
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 26,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Rick_Astley_Dallas.jpg/2560px-Rick_Astley_Dallas.jpg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
