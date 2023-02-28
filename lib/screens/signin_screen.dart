import 'dart:developer';

import 'package:amazon_clone/resources/auth_methods.dart';
import 'package:amazon_clone/screens/signup_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import '../widgets/custom_main_button.dart';
import '../widgets/text_field_widget.dart';
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
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                          const Text(
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
                              color: yellowColor,
                              isLoading: isLoading,
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                //Future.delayed(Duration(seconds: 10));
                                String output =
                                    await authenticationMethods.signInUser(
                                        email: emailController.text,
                                        password: passwordController.text);
                                setState(() {
                                  isLoading = false;
                                });
                                if (output == "Success") {
                                  //do something
                                  log(output);
                                } else {
                                  Utils().showSnackBar(
                                      context: context, content: output);
                                }
                              },
                              child: const Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
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
                        const Text(
                          ' New To Amazon? ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Expanded(
                          child: Container(height: 1, color: Colors.grey),
                        ),
                      ],
                    ),
                    CustomMainButton(
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Create An Account",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.6,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
