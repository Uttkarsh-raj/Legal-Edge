import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../app_consts/app_colors.dart';
import '../app_consts/app_constants.dart';
import '../services/models/lawyer_model.dart';
import '../utils/profile_utils.dart';
import 'chat_page.dart';

class LawyersProfile extends StatefulWidget {
  const LawyersProfile({super.key, required this.lawyer});
  final Lawyer lawyer;

  @override
  State<LawyersProfile> createState() => _LawyersProfileState();
}

class _LawyersProfileState extends State<LawyersProfile> {
  User user = FirebaseAuth.instance.currentUser!;
  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  void initState() {
    print(widget.lawyer);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorsConstants.primaryBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text(
          'Lawyer\'s Profile',
          style: TextStyle(
            color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Center(
              child: Container(
                // height: size.height * 0.42,
                width: size.width * 0.94,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(11, 8, 11, 8),
                  child: Column(
                    children: [
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 32,
                              child: CircleAvatar(
                                radius: 31,
                                backgroundImage: NetworkImage(
                                  widget.lawyer.profilePic ??
                                      AppConstantsProfile.defaultAvatar,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.lawyer.name}',
                                style: const TextStyle(
                                  color: AppColorsConstants.tertiaryBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.05,
                                ),
                              ),
                              Text(
                                '${widget.lawyer.email}',
                                style: TextStyle(
                                  color: AppColorsConstants.tertiaryBlackColor
                                      .withOpacity(0.7),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.05,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      if (widget.lawyer.discription != null)
                        const SizedBox(height: 10),
                      if (widget.lawyer.discription != null)
                        Text(
                          '${widget.lawyer.discription}',
                          style: TextStyle(
                            color: AppColorsConstants.tertiaryBlackColor
                                .withOpacity(0.7),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.05,
                          ),
                        ),
                      const SizedBox(height: 10),
                      const CustomDivider(),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColorsConstants.tertiaryBlackColor
                                .withOpacity(0.7),
                          ),
                          Text(
                            '${widget.lawyer.address}'
                            ' , '
                            '${widget.lawyer.city}',
                            style: TextStyle(
                              color: AppColorsConstants.tertiaryBlackColor
                                  .withOpacity(0.7),
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.05,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.phone,
                              color: AppColorsConstants.tertiaryBlackColor
                                  .withOpacity(0.7),
                            ),
                            Text(
                              '${widget.lawyer.contact}',
                              style: TextStyle(
                                color: AppColorsConstants.tertiaryBlackColor
                                    .withOpacity(0.7),
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const CustomDivider(),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Courts:',
                            style: TextStyle(
                              color: AppColorsConstants.tertiaryBlackColor
                                  .withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.05,
                            ),
                          ),
                        ),
                      ),
                      ShowHorizontalList(list: widget.lawyer.courts!),
                      const SizedBox(height: 10),
                      const CustomDivider(),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Cases:',
                            style: TextStyle(
                              color: AppColorsConstants.tertiaryBlackColor
                                  .withOpacity(0.7),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.05,
                            ),
                          ),
                        ),
                      ),
                      ShowHorizontalList(list: widget.lawyer.cases!),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            GestureDetector(
              onTap: () {
                String roomId =
                    chatRoomId(user.displayName!, widget.lawyer.name!);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ChatPage(
                      chatRoomId: roomId,
                      lawyer: widget.lawyer,
                    ),
                  ),
                );
              },
              child: Container(
                height: size.height * 0.06,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color:
                      AppColorsConstants.secondaryPurpleColor.withOpacity(0.3),
                ),
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.message_outlined),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Message',
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
