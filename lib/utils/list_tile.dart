import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_constants.dart';
import 'package:hackman/screens/chat_page.dart';

import '../services/models/lawyer_model.dart';

class CustomListTile extends StatefulWidget {
  const CustomListTile(
      {super.key,
      required this.title,
      required this.email,
      required this.photoUrl,
      required this.lawyer});
  final Lawyer lawyer;
  final String title;
  final String email;
  final String? photoUrl;
  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Container(
        height: size.height * 0.083,
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
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      print(
                          "go to the lawyers profile page but currently to chat");
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
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          widget.photoUrl ?? AppConstantsProfile.defaultAvatar),
                      radius: 23,
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
