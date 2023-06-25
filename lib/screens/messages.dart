import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackman/screens/chat_userr.dart';
import 'package:hackman/screens/main_auth_page.dart';
import 'package:hackman/services/apis/user_api_handler.dart';
import 'package:hackman/services/models/lawyer_model.dart';
import 'package:hackman/services/models/user_model.dart';

import '../app_consts/app_colors.dart';
import '../app_consts/app_constants.dart';
import 'chat_page.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  User user = FirebaseAuth.instance.currentUser!;
  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  Lawyer lawyer = Lawyer.fromJson({
    "_id": "6497880142ad54b1a477743c",
    "name": "Venkat",
    "email": "projflutter@gmail.com",
    "address": "Jayanagar",
    "city": "Bangalore",
    "regNo": "KA1234/5678",
    "cases": ["Corporate law", "Civil Defense", "Family Law"],
    "courts": ["Karnataka High Court"],
    "contact": "7657893021",
    "url":
        "https://lh3.googleusercontent.com/a/AAcHTtfbkonYkNl1rSsrWYbEU3NkfAtr_FwSfX-eJQE_=s96-c",
    "desc":
        "My practice involves handling diverse legal matters, including civil litigation, criminal defense, corporate law, family law, property disputes, and more. I am well-versed in the legal framework of Karnataka and have a deep understanding of the procedures and intricacies of the Karnataka High Court.",
    "ratings": 0,
    "createdAt": "25-06-2023",
    "contacts": ["harrypotter9838@gmail.com", "manishmadan101@gmail.com"],
    "calendly": "https://calendly.com/projflutter/meet",
    "__v": 2
  });

  UserModle user1 = UserModle.fromjson({
    "_id": "649788a101c089ccdf1e54e8",
    "name": "Harry Potter",
    "email": "harrypotter9838@gmail.com",
    "contact": "9876543210",
    "url":
        "https://lh3.googleusercontent.com/a/AAcHTteXTlqxznEuJeRbsHUlSvnCl6-iWND4krotamOG=s96-c",
    "createdAt": "25-06-2023",
    "role": "User",
    "contacts": ["projflutter@gmail.com"],
    "__v": 1
  });
  UserModle user2 = UserModle.fromjson(
    {
      "_id": "6497845e22f18c9ee43a8da6",
      "name": "Manish Madan",
      "email": "manishmadan101@gmail.com",
      "contact": "9876543201",
      "url":
          "https://lh3.googleusercontent.com/a/AAcHTtfj_CaQLR5TqoEgK_GgB2WBNDd5hCl-LTv2GNJsAA=s96-c",
      "createdAt": "24-06-2023",
      "role": "User",
      "contacts": [],
      "__v": 0
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Container(
            // height: size.height * 0.117,
            // width: size.width * 0.9,
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('khatri');
                      String roomId = chatRoomId(user1.name!, lawyer.name!);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserChat(
                            chatRoomId: roomId,
                            user: user1,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user1.profilePic ??
                              AppConstantsProfile.defaultAvatar),
                          radius: 23,
                        ),
                        const SizedBox(width: 8.0),
                        SizedBox(
                          width: size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user1.name!,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                user1.email!,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  GestureDetector(
                    onTap: () {
                      print('manish');
                      String roomId = chatRoomId(user2.name!, lawyer.name!);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserChat(
                            chatRoomId: roomId,
                            user: user2,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(user2.profilePic ??
                              AppConstantsProfile.defaultAvatar),
                          radius: 23,
                        ),
                        const SizedBox(width: 8.0),
                        SizedBox(
                          width: size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user2.name!,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                user2.email!,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
