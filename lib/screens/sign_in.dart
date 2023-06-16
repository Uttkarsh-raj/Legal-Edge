import 'package:flutter/material.dart';
import 'package:hackman/services/auth/auth_services.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => AuthServices().signInWithGoogle(),
              child: const Text("Google Sign In"),
            ),
          ),
        ],
      ),
    );
  }
}
