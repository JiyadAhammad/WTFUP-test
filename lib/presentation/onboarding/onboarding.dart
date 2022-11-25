import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:wtftest/presentation/home/home_screen.dart';

import '../constant/color/colors.dart';
import 'widget/onboarding_container.dart';

class ItemData {
  ItemData(
    this.color,
    this.image,
    this.text1,
    this.text2,
    this.text3,
  );
  final Color color;
  final String image;
  final String text1;
  final String text2;
  final String text3;
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  int page = 0;
  LiquidController? liquidController;
  UpdateType? updateType;
  // final  liquidController = LiquidController();

  List<ItemData> data = <ItemData>[
    ItemData(
      Colors.blue,
      'asset/image/onboardingimg1.jpg',
      'Hi',
      "It's Me",
      'JIYAD',
    ),
    ItemData(
      Colors.cyan,
      'asset/image/onboardingimg2.jpg',
      'Take a',
      'Look At',
      'New App',
    ),
    ItemData(
      Colors.green,
      'asset/image/onboardingimg3.jpg',
      'Liked?',
      'Fork!',
      'Enjoyed!',
    ),
    ItemData(
      Colors.yellow,
      'asset/image/onboardingimg4.jpg',
      'Can be',
      'Used for',
      'intoducing',
    ),
    ItemData(
      Colors.red,
      'asset/image/onboardingimg5.jpg',
      'Do',
      'try it',
      'Thank you',
    ),
  ];

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    final double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - (page - index).abs(),
      ),
    );
    final double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          LiquidSwipe.builder(
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return OnBoardingContainerWidget(
                data: data,
                index: index,
              );
            },
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            onPageChangeCallback: pageChangeCallback,
            liquidController: liquidController,
            fullTransitionValue: 880,
            enableSideReveal: true,
            ignoreUserGestureWhileAnimating: true,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                const Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(data.length, _buildDot),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: liquidController!.currentPage != 4
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblack,
                      ),
                      onPressed: () {
                        liquidController!.animateToPage(
                          page: data.length - 1,
                          duration: 700,
                        );
                      },
                      child: const Text('Skip to End'),
                    )
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblack,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: () {
                        Get.offAll(
                          () => const HomeScreen(),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                        ),
                      ),
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: liquidController!.currentPage != 4
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kblack,
                      ),
                      onPressed: () {
                        liquidController!.jumpToPage(
                          page: liquidController!.currentPage + 1 >
                                  data.length - 1
                              ? 0
                              : liquidController!.currentPage + 1,
                        );
                      },
                      child: const Text('Next'),
                    )
                  : const SizedBox(),
            ),
          )
        ],
      ),
    );
  }

  dynamic pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
