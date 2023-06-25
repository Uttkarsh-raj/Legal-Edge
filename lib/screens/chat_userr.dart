import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackman/services/models/user_model.dart';

import '../app_consts/app_colors.dart';
import '../app_consts/app_constants.dart';
import '../services/models/lawyer_model.dart';
import '../utils/input_field.dart';
import '../utils/message_widget.dart';

class UserChat extends StatefulWidget {
  const UserChat({super.key, required this.chatRoomId, required this.user});
  final String chatRoomId;
  final UserModle user;

  @override
  State<UserChat> createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  TextEditingController message = TextEditingController();

  void onSendMessage() async {
    if (message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendBy": widget.user.name,
        "message": message.text,
        "time": FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection('Chatroom')
          .doc(widget.chatRoomId)
          .collection('chats')
          .add(messages);
      message.clear();
    } else {
      // print("Enter some text: Snackbar"); TODO: Add Snackbar with proper text
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorsConstants.primaryBackgroundColor,
      appBar: AppBar(
        elevation: 6,
        centerTitle: true,
        title: SizedBox(
          width: size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.user.profilePic ?? AppConstantsProfile.defaultAvatar,
                ),
                radius: 18,
              ),
              const SizedBox(width: 9.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Text(
                  //   widget.user.email!,
                  //   style: const TextStyle(
                  //     fontSize: 12.0,
                  //     color: Colors.grey,
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('Chatroom')
                      .doc(widget.chatRoomId)
                      .collection('chats')
                      .orderBy("time", descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data != null) {
                      if (snapshot.data?.docs.length != 0) {
                        return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data?.docs[index]['sendBy'] ==
                                widget.user.name) {
                              return ReceivedMessage(
                                message: snapshot.data?.docs[index]['message'],
                                key: widget.key,
                              );
                            } else if (snapshot.data?.docs[index]['sendBy'] ==
                                lawyer.name) {
                              return SentMessage(
                                message: snapshot.data?.docs[index]['message'],
                                key: widget.key,
                              );
                            }
                            // return Text(snapshot.data?.docs[index]['message']);
                          },
                        );
                      } else {
                        return const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Say Hii and,',
                              ),
                              Text('start a new conversation.'),
                            ],
                          ),
                        );
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
            Row(
              children: [
                InputField(
                  hinttext: 'Type a message',
                  controller: message,
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onSendMessage,
                  child: const Icon(Icons.send),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
