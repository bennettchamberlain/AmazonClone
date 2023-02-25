import 'package:amazon_clone/screens/signup_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widget/custom_main_button.dart';
import 'package:amazon_clone/widget/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: screensize.height,
          width: screensize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                    amazonLogo,
                    height: screensize.height * 0.1,
                  ),
                  Container(
                    padding: const EdgeInsets.all(25),
                    height: screensize.height * 0.5,
                    width: screensize.width * 0.8,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 25),
                        ),
                        TextFieldWidget(
                          title: 'Email',
                          textController: emailController,
                          obscureText: false,
                          hintText: "Enter Your Email",
                        ),
                        TextFieldWidget(
                          title: 'Password',
                          textController: passwordController,
                          obscureText: true,
                          hintText: "Enter Your Password",
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomMainButton(
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            color: yellowColor,
                            isLoading: false,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 1, color: Colors.grey),
                      ),
                      Text(
                        ' New To Amazon? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(height: 1, color: Colors.grey),
                      ),
                    ],
                  ),
                  CustomMainButton(
                    child: Text(
                      "Create An Account",
                      style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.6,
                          color: Colors.black),
                    ),
                    color: Colors.grey[400]!,
                    isLoading: false,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
