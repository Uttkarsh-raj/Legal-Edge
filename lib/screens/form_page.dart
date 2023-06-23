import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackman/screens/main_auth_page.dart';
import 'package:hackman/services/apis/lawyer_api_handler.dart';
import 'package:hackman/utils/form_utils.dart';
import '../app_consts/app_colors.dart';
import '../services/apis/user_api_handler.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key, required this.user});
  final User user;

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  TextEditingController descController = TextEditingController();
  bool isChecked = false;
  List<String> cases = [];
  List<String> courts = [];

  @override
  void initState() {
    nameController = TextEditingController(text: user.displayName ?? "");
    emailController = TextEditingController(text: user.email ?? "");
    contactController = TextEditingController(text: user.phoneNumber ?? "");
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    contactController.dispose();
    cityController.dispose();
    regNoController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Form',
          style: TextStyle(
            color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (nameController.text.isNotEmpty &&
                  emailController.text.isNotEmpty &&
                  contactController.text.isNotEmpty &&
                  cityController.text.isNotEmpty &&
                  addressController.text.isNotEmpty &&
                  descController.text.isNotEmpty) {
                if (!isChecked) {
                  UserApiHandler.registerUser(
                    nameController.text.toString().trim(),
                    emailController.text.toString().trim(),
                    contactController.text.toString().trim(),
                    user.photoURL.toString().trim(),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainAuthPage(),
                    ),
                  );
                } else {
                  //TODO: Show Snackbar...
                }
              }
              if (isChecked) {
                if (nameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    descController.text.isNotEmpty) {
                  LawyerApiHandler.registerLawyer(
                    user.photoURL.toString().trim(),
                    nameController.text.toString().trim(),
                    emailController.text.toString().trim(),
                    addressController.text.toString().trim(),
                    cityController.text.toString().trim(),
                    regNoController.text.toString().trim(),
                    cases,
                    courts,
                    contactController.text.toString().trim(),
                    descController.text.toString().trim(),
                  );
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainAuthPage(),
                    ),
                  );
                } else {
                  //TODO: Show Snackbar...
                }
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: AppColorsConstants.tertiaryBlackColor.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              FormFields(
                controller: nameController,
                title: 'Name',
                hint: (nameController.text.isEmpty) ? 'Name' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: emailController,
                title: 'Email',
                hint: (emailController.text.isEmpty) ? 'Email' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: contactController,
                title: 'Contact',
                hint: (contactController.text.isEmpty) ? 'Contact' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: cityController,
                title: 'City',
                hint: (cityController.text.isEmpty) ? 'City' : null,
              ),
              const SizedBox(height: 13),
              FormFields(
                controller: addressController,
                title: 'Address',
                hint: (addressController.text.isEmpty) ? 'Address' : null,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  const Text(
                    'I am a Lawyer',
                    style: TextStyle(
                      color: AppColorsConstants.tertiaryBlackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              if (isChecked)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Discription: ',
                      style: TextStyle(
                        color: AppColorsConstants.tertiaryBlackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Container(
                      height: size.height * 0.1,
                      width: size.width * 0.68,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.4,
                          color: AppColorsConstants.tertiaryBlackColor
                              .withOpacity(0.6),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                          child: TextField(
                            maxLines: 50,
                            controller: descController,
                            decoration: InputDecoration(
                              hintText: (descController.text.isEmpty)
                                  ? 'Discription'
                                  : null,
                              hintStyle: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 13),
              if (isChecked)
                FormFields(
                  controller: regNoController,
                  title: 'Reg No.',
                  hint: 'Registration No.',
                ),
              const SizedBox(height: 13),
              if (isChecked)
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Courts: ',
                            style: TextStyle(
                              color: AppColorsConstants.tertiaryBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 14),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddElementDialog(
                                    onAdd: (String element) {
                                      setState(() {
                                        courts.add(element);
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Add Court',
                              style: TextStyle(
                                color: AppColorsConstants.tertiaryBlackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: courts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Icon(
                                Icons.circle_sharp,
                                size: 13,
                                color: AppColorsConstants.tertiaryBlackColor
                                    .withOpacity(0.7),
                              ),
                              title: Text(
                                courts[index],
                                style: const TextStyle(
                                  color: AppColorsConstants.tertiaryBlackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    courts.remove(courts[index]);
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 18,
                                  color: AppColorsConstants.tertiaryBlackColor
                                      .withOpacity(0.7),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 13),
              if (isChecked)
                SizedBox(
                  width: size.width,
                  height: size.height * 0.2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Cases: ',
                            style: TextStyle(
                              color: AppColorsConstants.tertiaryBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 14),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddElementDialog(
                                    onAdd: (String element) {
                                      setState(() {
                                        cases.add(element);
                                      });
                                    },
                                  );
                                },
                              );
                            },
                            child: const Text(
                              'Add Cases',
                              style: TextStyle(
                                color: AppColorsConstants.tertiaryBlackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cases.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Icon(
                                Icons.circle_sharp,
                                size: 13,
                                color: AppColorsConstants.tertiaryBlackColor
                                    .withOpacity(0.7),
                              ),
                              title: Text(
                                cases[index],
                                style: const TextStyle(
                                  color: AppColorsConstants.tertiaryBlackColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    cases.remove(cases[index]);
                                  });
                                },
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 18,
                                  color: AppColorsConstants.tertiaryBlackColor
                                      .withOpacity(0.7),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddElementDialog extends StatefulWidget {
  final Function(String) onAdd;

  const AddElementDialog({super.key, required this.onAdd});

  @override
  _AddElementDialogState createState() => _AddElementDialogState();
}

class _AddElementDialogState extends State<AddElementDialog> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Element'),
      content: TextFormField(
        controller: _textEditingController,
        decoration: const InputDecoration(
          labelText: 'Element',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            String element = _textEditingController.text.trim();
            if (element.isNotEmpty) {
              widget.onAdd(element);
            }
            Navigator.pop(context);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
