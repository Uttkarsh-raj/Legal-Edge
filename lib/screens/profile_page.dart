import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackman/app_consts/app_colors.dart';
import 'package:hackman/app_consts/app_constants.dart';

import '../services/models/user_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userData});
  final UserModle userData;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;

  void logout() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorsConstants.primaryBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        // elevation: 2,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor:
                    AppColorsConstants.secondaryPurpleColor.withOpacity(0.2),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    widget.userData.profilePic ??
                        AppConstantsProfile.defaultAvatar,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '${widget.userData.name}',
              style: const TextStyle(
                color: AppColorsConstants.tertiaryBlackColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.05,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${widget.userData.email}',
              style: TextStyle(
                color: AppColorsConstants.tertiaryBlackColor.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.05,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${widget.userData.contact}',
              style: TextStyle(
                color: AppColorsConstants.tertiaryBlackColor.withOpacity(0.7),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.05,
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: logout,
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color:
                      AppColorsConstants.secondaryPurpleColor.withOpacity(0.3),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout_outlined),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Log Out',
                        style: TextStyle(
                          color: AppColorsConstants.tertiaryBlackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.05,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
