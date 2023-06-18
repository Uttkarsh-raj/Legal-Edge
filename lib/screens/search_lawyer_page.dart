import 'package:flutter/material.dart';
import 'package:hackman/services/apis/lawyer_api_handler.dart';
import 'package:hackman/services/models/lawyer_model.dart';
import 'package:hackman/utils/input_field.dart';

import '../app_consts/app_colors.dart';

class SearchLawyerPage extends StatefulWidget {
  const SearchLawyerPage({super.key});

  @override
  State<SearchLawyerPage> createState() => _SearchLawyerPageState();
}

class _SearchLawyerPageState extends State<SearchLawyerPage> {
  TextEditingController searchController = TextEditingController();
  List<Lawyer> lawyers = [];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getLawyers() async {
    lawyers = await LawyerApiHandler.getLawyers();
  }

  @override
  void initState() {
    getLawyers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search',
          style: TextStyle(
            color: AppColorsConstants.tertiaryBlackColor,
            fontSize: 21,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: getLawyers,
                  child: InputField(
                    controller: searchController,
                    hinttext: 'Search',
                  ),
                ),
                Icon(
                  Icons.search_outlined,
                  size: 30,
                  color: AppColorsConstants.tertiaryBlackColor.withOpacity(0.7),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: lawyers.length,
                itemBuilder: (context, index) {
                  return Text(lawyers[index].name!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
