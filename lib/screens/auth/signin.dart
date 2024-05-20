import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodcourt/constants/data.dart';
import 'package:foodcourt/screens/auth/signup.dart';
import 'package:foodcourt/screens/home/home_screen.dart';
import 'package:foodcourt/screens/onboarding/onboarding_screen.dart';
import 'package:foodcourt/themes/app_colors.dart';
import 'package:foodcourt/widgets/textfield/app_textfield.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_screen.dart';

class SignIn extends StatefulWidget {
  SignIn({
    Key? key,
    required this.onNext,
  }) : super(key: key);
  final VoidCallback onNext;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool rememberMe = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future signIn() async {
      try {
        if (passwordController.text.trim().isEmpty ||
            emailController.text.trim().isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  // Code to execute.
                },
              ),
              content: const Text('Please complete the entire form'),
              duration: const Duration(milliseconds: 1500),
              width: 280.0,
              // Width of the SnackBar.
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0, // Inner padding for SnackBar content.
              ),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        } else {
          await auth.signInWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim());

        }
      } on FirebaseAuthException catch (e) {
        print(e);
        log("Failed to log in");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            action: SnackBarAction(
              label: 'Close',
              onPressed: () {
                // Code to execute.
              },
            ),
            content: Text(e.message!),
            duration: const Duration(milliseconds: 1500),
            width: 280.0,
            // Width of the SnackBar.
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0, // Inner padding for SnackBar content.
            ),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        );
      }
      // Navigator.of(context) is not working !
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(29, 0, 29, 0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            AppTextFormField(
              hint: 'Email Address',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              hint: 'Password',
              controller: passwordController,
              obscurable: true,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 28,
                  child: Checkbox(
                    splashRadius: 3,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fillColor: MaterialStatePropertyAll(primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                ),
                Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 12,
                    color: rememberMe
                        ? primaryColor
                        : primaryTextColor.withOpacity(0.7),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 35,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            AppButton(
              text: 'Sign in',
              onPressed: signIn,
              // Get.toNamed(HomeScreen.routeName);
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Dont have an account?'),
                TextButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: widget.onNext,
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
