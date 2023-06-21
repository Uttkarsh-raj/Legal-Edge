import 'package:flutter/material.dart';
import '../app_consts/app_colors.dart';

class FormFields extends StatelessWidget {
  const FormFields(
      {super.key, required this.controller, this.hint, required this.title});
  final TextEditingController controller;
  final String? hint;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$title: ',
          style: const TextStyle(
            color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Container(
          height: size.height * 0.05,
          width: size.width * 0.73,
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
                controller: controller,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
