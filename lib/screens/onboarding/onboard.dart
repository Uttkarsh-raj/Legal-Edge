import 'package:flutter/material.dart'
    show
        Alignment,
        AssetImage,
        BoxDecoration,
        BoxFit,
        BuildContext,
        Center,
        Color,
        Container,
        Curves,
        DecorationImage,
        EdgeInsets,
        GestureDetector,
        Key,
        MainAxisAlignment,
        MaterialPageRoute,
        MediaQuery,
        Navigator,
        PageController,
        PageView,
        Row,
        Scaffold,
        Size,
        Stack,
        State,
        StatefulWidget,
        Text,
        TextStyle,
        Widget;
import 'package:flutter/rendering.dart';
import 'package:hackman/app_consts/app_colors.dart';
import 'package:hackman/screens/onboarding/onboarding_first.dart';
import 'package:hackman/screens/onboarding/onboarding_second.dart';
import 'package:hackman/screens/onboarding/onboarding_third.dart';
import 'package:hackman/screens/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  //controller to keep track of the page we are in
  PageController _controller = PageController();

  //if at last page
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          //PAGE VIEW
          children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              controller: _controller,
              children: const [
                OnBoardinngFirst(),
                OnBoardingSecond(),
                OnboardinngThird(),
              ],
            ),

            //DOT INDICATOR
            Container(
              alignment: const Alignment(0.0, 0.2),
              child: SmoothPageIndicator(controller: _controller, count: 3),
            ), //controller is the count of the page we are att and count is the maximum number of pages

            //Navigate
            Center(
              child: Container(
                padding: EdgeInsets.only(bottom: size.height * 0.3),
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.jumpToPage(2);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColorsConstants.secondaryPurpleColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    //NEXT

                    onLastPage
                        ? GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const SignInPage();
                              }));
                            },
                            child: const Text(
                              'Done',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColorsConstants.secondaryPurpleColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: const Text(
                              'Next',
                              style: TextStyle(
                                fontSize: 18,
                                color: AppColorsConstants.secondaryPurpleColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
