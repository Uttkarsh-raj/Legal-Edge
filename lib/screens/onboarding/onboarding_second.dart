import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../../app_consts/app_colors.dart';

class OnBoardingSecond extends StatefulWidget {
  const OnBoardingSecond({super.key});

  @override
  State<OnBoardingSecond> createState() => _OnBoardingSecondState();
}

class _OnBoardingSecondState extends State<OnBoardingSecond> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:
          AppColorsConstants.primaryBackgroundColor.withOpacity(0.5),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Image.asset(
                'asset/images/chattting.png',
                height: size.height * 0.47,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 3, 8, 3),
            child: Text(
              'Realtime Messaging for easy Communication',
              style: TextStyle(
                color: AppColorsConstants.secondaryPurpleColor.withOpacity(0.7),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: WaveWidget(
              config: CustomConfig(
                colors: [
                  AppColorsConstants.secondaryPurpleColor,
                  AppColorsConstants.secondaryPurpleColor.withOpacity(0.5),
                  AppColorsConstants.secondaryPurpleColor.withOpacity(0.3),
                  AppColorsConstants.secondaryPurpleColor.withOpacity(0.2),
                ],
                durations: [7400, 5800, 4800, 3700],
                heightPercentages: [0.65, 0.55, 0.48, 0.4],
              ),
              size: Size(double.infinity, size.height * 0.55),
            ),
          ),
        ],
      ),
    );
  }
}
