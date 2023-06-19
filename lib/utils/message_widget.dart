import 'package:flutter/material.dart';

class SentMessage extends StatelessWidget {
  final String message;
  const SentMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 50, top: 3, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 20),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: const BoxDecoration(
                      color: Color(0xffF1ECFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(18),
                        bottomRight: Radius.circular(0),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ),
                ),
                CustomPaint(painter: CustomShape1(const Color(0xff00C2CB))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShape1 extends CustomPainter {
  final Color bgColor;

  CustomShape1(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ReceivedMessage extends StatelessWidget {
  final String message;
  const ReceivedMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 18.0, left: 5, top: 3, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 30),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xff005F99).withOpacity(0.9),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(18),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(18),
                        topRight: Radius.circular(18),
                      ),
                    ),
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                CustomPaint(painter: CustomShape(const Color(0xff005F99))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomPainter {
  final Color bgColor;

  CustomShape(this.bgColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = bgColor;

    var path = Path();
    path.lineTo(5, 0);
    path.lineTo(0, 10);
    path.lineTo(5, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
