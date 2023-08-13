import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodcourt/screens/home/home_screen.dart';
import 'package:foodcourt/screens/onboarding/onboarding_screen.dart';
import 'package:foodcourt/themes/app_colors.dart';
import 'package:foodcourt/widgets/textfield/app_textfield.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_screen.dart';

class SignIn extends StatefulWidget {
  const SignIn({
    Key? key,
  }) : super(key: key);

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

    Future signIn() async{
      try {
        await auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim()
        );
      } on FirebaseAuthException catch (e) {
        print(e);
        log("Failed to log in");
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text("Error"),
            content: Text("Email or password incorrect"),
          );
        });
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
            TextField(controller: emailController,
              decoration: InputDecoration(labelText: 'Email Address'),
            ),
            const SizedBox(height: 16),
            TextField(controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
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
              onPressed:
                signIn,
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
                  onPressed: signIn,
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
