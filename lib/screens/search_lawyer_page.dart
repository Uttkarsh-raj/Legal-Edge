import 'package:flutter/material.dart';
import 'package:hackman/services/apis/lawyer_api_handler.dart';
import 'package:hackman/services/apis/user_api_handler.dart';
import 'package:hackman/services/models/lawyer_model.dart';
import 'package:hackman/utils/input_field.dart';

import '../app_consts/app_colors.dart';
import '../utils/list_tile.dart';

class SearchLawyerPage extends StatefulWidget {
  const SearchLawyerPage({super.key});

  @override
  State<SearchLawyerPage> createState() => _SearchLawyerPageState();
}

class _SearchLawyerPageState extends State<SearchLawyerPage> {
  TextEditingController searchController = TextEditingController();
  List<Lawyer> lawyers = [];
  List<Lawyer> users = [];
  bool present = false;
  bool city = false;
  bool courts = false;
  bool cases = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void getLawyers() async {
    lawyers = await LawyerApiHandler.getLawyers();
    setState(() {
      if (lawyers.isNotEmpty) present = true;
    });
  }

  void getUsers() async {
    users = await UserApiHandler.getUser(null);
    setState(() {
      if (lawyers.isNotEmpty) present = true;
    });
  }

  void searchLawyers(String search) async {
    setState(() {
      lawyers.clear();
    });
    if (cases && search.isNotEmpty) {
      lawyers = await LawyerApiHandler.searchLawyersByCases(search);
      print(lawyers);
      setState(() {
        if (lawyers.isNotEmpty) {
          present = true;
        } else {
          present = false;
        }
      });
    } else if (courts && search.isNotEmpty) {
      lawyers = await LawyerApiHandler.searchLawyersByCourt(search);
      print(lawyers);
      setState(() {
        if (lawyers.isNotEmpty) {
          present = true;
        } else {
          present = false;
        }
      });
    } else if (city && search.isNotEmpty) {
      lawyers = await LawyerApiHandler.searchLawyersByCity(search);
      print(lawyers);
      setState(() {
        if (lawyers.isNotEmpty) {
          present = true;
        } else {
          present = false;
        }
      });
    } else if (cases && search.isNotEmpty) {
      lawyers = await LawyerApiHandler.searchLawyersByCases(search);
      print(lawyers);
      setState(() {
        if (lawyers.isNotEmpty) present = true;
      });
    } else if (search.isNotEmpty) {
      lawyers = await LawyerApiHandler.searchLawyers(search);
      setState(() {
        if (lawyers.isNotEmpty) present = true;
      });
    } else {
      lawyers = await LawyerApiHandler.getLawyers();
      setState(() {
        if (lawyers.isNotEmpty) present = true;
      });
    }
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
                InputField(
                  controller: searchController,
                  hinttext: 'Search',
                ),
                GestureDetector(
                  onTap: () =>
                      searchLawyers(searchController.text.toString().trim()),
                  child: Icon(
                    Icons.search_outlined,
                    size: 30,
                    color:
                        AppColorsConstants.tertiaryBlackColor.withOpacity(0.7),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Filter by:'),
                Checkbox(
                  value: city,
                  onChanged: (value) {
                    setState(() {
                      courts = false;
                      cases = false;
                      city = !city;
                    });
                  },
                ),
                const Text('City'),
                Checkbox(
                  value: cases,
                  onChanged: (value) {
                    setState(() {
                      city = false;
                      cases = !cases;
                      courts = false;
                    });
                  },
                ),
                const Text('Cases'),
                Checkbox(
                  value: courts,
                  onChanged: (value) {
                    setState(() {
                      courts = !courts;
                      city = false;
                      cases = false;
                    });
                  },
                ),
                const Text('Courts'),
              ],
            ),
            const SizedBox(height: 10),
            (present)
                ? Expanded(
                    child: ListView.builder(
                      itemCount: lawyers.length,
                      itemBuilder: (context, index) {
                        return CustomListTile(
                          lawyer: lawyers[index],
                          title: lawyers[index].name!,
                          email: lawyers[index].email!,
                          photoUrl: lawyers[index].profilePic,
                        );
                        // return Text(lawyers[index].name!);
                      },
                    ),
                  )
                : const Center(
                    child: Text('No data found'),
                  ),
          ],
        ),
      ),
    );
  }
}
