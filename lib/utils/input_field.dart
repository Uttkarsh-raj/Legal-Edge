import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_colors.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key, required this.hinttext, this.controller, this.focus});
  final String hinttext;
  final TextEditingController? controller;
  final FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width * 0.83,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Container(
              height: size.height * 0.055,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.4,
                  color: AppColorsConstants.tertiaryBlackColor.withOpacity(0.6),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: TextField(
                    focusNode: focus,
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: hinttext,
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
