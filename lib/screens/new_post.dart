import 'package:flutter/material.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.close_outlined,
            size: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 3, 15, 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(0),
                hintText: 'Title',
                hintStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: TextField(
                maxLines: 50,
                controller: descriptionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(0),
                  hintText: 'Discription',
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Icon(
                    Icons.photo,
                    color: Colors.grey[700],
                    size: 35,
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.video_file,
                    color: Colors.grey[700],
                    size: 35,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
