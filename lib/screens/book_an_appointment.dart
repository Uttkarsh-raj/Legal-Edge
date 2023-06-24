import 'package:flutter/material.dart';
import 'package:hackman/app_consts/app_colors.dart';

class BookAppointment extends StatefulWidget {
  const BookAppointment({super.key});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  TextEditingController descController = TextEditingController();
  @override
  void dispose() {
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorsConstants.primaryBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                const Center(
                  child: Text(
                    'Discription: ',
                    style: TextStyle(
                      color: AppColorsConstants.tertiaryBlackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: size.height * 0.3,
                  width: size.width * 0.92,
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
                        decoration: const InputDecoration(
                          hintText: 'Discription',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.063,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17),
                      color: AppColorsConstants.secondaryPurpleColor
                          .withOpacity(0.3),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.book),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Book Appointment',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
