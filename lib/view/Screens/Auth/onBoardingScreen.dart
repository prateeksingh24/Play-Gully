import 'package:animated_introduction/animated_introduction.dart';

import 'package:cash_point/view/Screens/Auth/loginPage.dart';

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final List<SingleIntroScreen> pages = [
      const SingleIntroScreen(
        title: 'Welcome to Reward Genie!',
        description:
            'Earn rewards with every action you take. From shopping to completing tasks, we turn your activities into exciting rewards!',
        imageAsset: 'assets/onboard/onboard1.png',
        sideDotsBgColor: Color.fromARGB(255, 21, 17, 86),
        mainCircleBgColor: Colors.white,
      ),
      const SingleIntroScreen(
        title: 'Earn Points with Every Interaction',
        description:
            'Collect points by making purchases, completing surveys, and more. Your points add up to incredible rewards!',
        imageAsset: 'assets/onboard/onboard2.png',
        sideDotsBgColor: Color.fromARGB(255, 21, 17, 86),
        mainCircleBgColor: Colors.white,
      ),
      const SingleIntroScreen(
        title: 'Redeem Rewards and Enjoy!',
        description:
            'Use your points to unlock discounts, special offers, and exclusive rewards. The more you earn, the more you get!',
        imageAsset: 'assets/onboard/onboard3.png',
        sideDotsBgColor: Color.fromARGB(255, 21, 17, 86),
        mainCircleBgColor: Colors.white,
      ),
    ];

    return Scaffold(
      body: AnimatedIntroduction(
        slides: pages,
        footerGradients: const [
          Color(0xff11132A),
          Color.fromARGB(255, 41, 23, 70),
        ],
        indicatorType: IndicatorType.circle,
        footerBgColor: const Color.fromARGB(255, 21, 17, 86),
        onDone: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
      ),
    );
  }
}
