import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodcourt/screens/onboarding/onboarding_screen.dart';
import 'package:foodcourt/themes/app_colors.dart';
import 'package:foodcourt/widgets/textfield/app_textfield.dart';
import 'package:get/get.dart';

import 'auth_screen.dart';

class Signup extends StatefulWidget {
  const Signup({
    Key? key, required this.onNext,
  }) : super(key: key);
  final VoidCallback onNext;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }
  bool rememberMe = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future signUp() async{
      try {
        if (passwordController.text.trim() != confirmPasswordController.text.trim()){
          showDialog(context: context, builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("Passwords not identical"),
            );
          });
        }  else{
          await auth.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim()
          );
      }
      } on FirebaseAuthException catch (e) {
        print(e);
        log("Failed to log in");
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
            title: Text("Error"),
            content: Text(e.message!),
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
            const SizedBox(height: 12),
            AppTextFormField(hint: 'Email Address', controller: emailController,),
            const SizedBox(height: 10),
            AppTextFormField(hint: 'Password', controller: passwordController,obscurable: true),
            const SizedBox(height: 10),
            AppTextFormField(hint: 'Confirm Password', controller: confirmPasswordController, obscurable: true),
            const SizedBox(height: 18),
            AppButton(
              text: 'Sign up',
              onPressed: signUp,
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
                    'Sign in',
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
