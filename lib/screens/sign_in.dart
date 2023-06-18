import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_colors.dart';
import 'package:hackman/services/apis/user_api_handler.dart';
import 'package:hackman/services/auth/auth_services.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset(
                'asset/images/login.png',
                height: size.height * 0.47,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: AppColorsConstants.secondaryPurpleColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.4,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Welcome to',
                  ),
                  TextSpan(
                    text: ' LegalEdge,',
                    style: TextStyle(
                      color: AppColorsConstants.secondaryPurpleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 3),
            child: Text(
              'Unlock legal advice at your fingertips',
              style: TextStyle(
                color: AppColorsConstants.secondaryPurpleColor.withOpacity(0.7),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Sign In to continue ...',
              style: TextStyle(
                color: AppColorsConstants.tertiaryBlackColor.withOpacity(0.8),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  UserCredential userCredential =
                      await AuthServices().signInWithGoogle();
                  User user = userCredential.user!;
                  if (userCredential.additionalUserInfo!.isNewUser) {
                    UserApiHandler.registerUser(
                      user.displayName.toString().trim(),
                      user.email.toString().trim(),
                      user.phoneNumber.toString().trim(),
                      user.photoURL.toString().trim(),
                    );
                  }
                },
                child: SizedBox(
                  width: size.width / 2.5,
                  height: size.height * 0.054,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'asset/icons/google.png',
                        scale: size.width * 0.06,
                      ),
                      const Text("Google Sign In"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  AppColorsConstants.secondaryPurpleColor,
                  AppColorsConstants.secondaryPurpleColor.withOpacity(0.5),
                  AppColorsConstants.secondaryPurpleColor.withOpacity(0.3),
                  AppColorsConstants.secondaryPurpleColor.withOpacity(0.2),
                ],
                durations: [7400, 5800, 4800, 3700],
                heightPercentages: [0.55, 0.37, 0.22, 0.1],
              ),
              size: Size(double.infinity, size.height * 0.55),
            ),
          ),
        ],
      ),
    );
  }
}
