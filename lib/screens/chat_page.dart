import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_colors.dart';
import 'package:hackman/services/models/lawyer_model.dart';
import 'package:hackman/utils/input_field.dart';
import 'package:hackman/utils/message_widget.dart';

import '../app_consts/app_constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.lawyer, required this.chatRoomId});
  final Lawyer lawyer;
  final String chatRoomId;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  TextEditingController message = TextEditingController();

  void onSendMessage() async {
    if (message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendBy": user?.displayName,
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
      print("Enter some text: Snackbar");
    }
  }

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
                  widget.lawyer.profilePic ?? AppConstantsProfile.defaultAvatar,
                ),
                radius: 18,
              ),
              const SizedBox(width: 9.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.lawyer.name!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.lawyer.email!,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
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
                                user?.displayName) {
                              return SentMessage(
                                message: snapshot.data?.docs[index]['message'],
                                key: widget.key,
                              );
                            } else if (snapshot.data?.docs[index]['sendBy'] ==
                                widget.lawyer.name) {
                              return ReceivedMessage(
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
