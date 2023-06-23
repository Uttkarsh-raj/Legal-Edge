import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_colors.dart';
import 'package:hackman/services/models/post_model.dart';
import 'package:hackman/utils/profile_utils.dart';

import '../app_consts/app_constants.dart';
import '../utils/input_field.dart';

class IndividualPostPage extends StatefulWidget {
  const IndividualPostPage({super.key, required this.post});
  final Post post;

  @override
  State<IndividualPostPage> createState() => _IndividualPostPageState();
}

class _IndividualPostPageState extends State<IndividualPostPage> {
  TextEditingController comment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final FocusNode focusNode = FocusNode();

    return Scaffold(
      backgroundColor: AppColorsConstants.primaryBackgroundColor,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 22,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
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
                        '${widget.post.name}',
                        style: const TextStyle(
                          color: AppColorsConstants.tertiaryBlackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.05,
                        ),
                      ),
                      Text(
                        '${widget.post.time}',
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
              const SizedBox(height: 8),
              Text(
                '${widget.post.title}',
                style: const TextStyle(
                  color: AppColorsConstants.tertiaryBlackColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.05,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${widget.post.description}',
                style: const TextStyle(
                  color: AppColorsConstants.tertiaryBlackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.05,
                ),
              ),
              const SizedBox(height: 8),
              const CustomDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(Icons.thumb_up),
                      onPressed: () {},
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(Icons.comment),
                      onPressed: () => focusNode.requestFocus(),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(Icons.share),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const CustomDivider(),
              const SizedBox(height: 8),
              Row(
                children: [
                  InputField(
                    hinttext: 'Comment here',
                    focus: focusNode,
                    controller: comment,
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {}, //TODO: add comment feature post
                    child: const Icon(Icons.send),
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
