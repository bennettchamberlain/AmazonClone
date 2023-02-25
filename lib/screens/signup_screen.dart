import 'package:flutter/material.dart';

import '../utils/color_themes.dart';
import '../utils/constants.dart';
import '../utils/utils.dart';

// import '../widgets/custom_main_button.dart';
// import '../widgets/text_field_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
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
                  SizedBox(
                    height: screensize.height * 0.7,
                    child: FittedBox(
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        height: screensize.height * 0.7,
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
                              "Sign Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 25),
                            ),
                            TextFieldWidget(
                              title: 'Name',
                              textController: nameController,
                              obscureText: false,
                              hintText: "Enter Your Name",
                            ),
                            TextFieldWidget(
                              title: 'Address',
                              textController: addressController,
                              obscureText: false,
                              hintText: "Enter Your Address",
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
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                color: yellowColor,
                                isLoading: false,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(height: 1, color: Colors.grey),
                      ),
                      Text(
                        ' Already Have An Account? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Expanded(
                        child: Container(height: 1, color: Colors.grey),
                      ),
                    ],
                  ),
                  CustomMainButton(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.6,
                            color: Colors.black),
                      ),
                      color: Colors.grey[400]!,
                      isLoading: false,
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
