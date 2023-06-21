import 'package:flutter/material.dart';

class CustomDivider extends StatefulWidget {
  const CustomDivider({super.key});

  @override
  State<CustomDivider> createState() => _CustomDividerState();
}

class _CustomDividerState extends State<CustomDivider> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.9,
      height: size.width * 0.008,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.1,
            blurRadius: 0.1,
            offset: const Offset(0, .1),
          ),
        ],
      ),
    );
  }
}

class ShowHorizontalList extends StatefulWidget {
  const ShowHorizontalList({super.key, required this.list});
  final List list;

  @override
  State<ShowHorizontalList> createState() => _ShowHorizontalListState();
}

class _ShowHorizontalListState extends State<ShowHorizontalList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.0503,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.9),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                    child: Text(
                  widget.list[index],
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                  ),
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
