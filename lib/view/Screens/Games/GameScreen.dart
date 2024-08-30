import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Data/GameList.dart';
import 'package:cash_point/Model/gamesModel.dart';
import 'package:cash_point/Widget/AppBarWidget.dart';
import 'package:cash_point/Widget/GamesCard.dart';

import 'package:flutter/material.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
 

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const AppBarWidget(title: "CASHPOINT"),
      backgroundColor: AppColor.kMain,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(
                left: 13,
              ),
              width: width - 20,
              height: 200,
              decoration: BoxDecoration(
                  color: AppColor.kSecondary,
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Positioned(
                      right: -50,
                      top: 0,
                      child: Image.asset(
                        "assets/Icons/banner1.png",
                        width: 220,
                        height: 200,
                        fit: BoxFit.cover,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "CLAIM YOUR DAILY \nBONUS",
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        "And you can claim once in a day",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Cabin",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 145,
                        height: 50,
                        padding: const EdgeInsets.only(
                            left: 2, right: 10, top: 2, bottom: 3),
                        decoration: BoxDecoration(
                            // color: AppColor.kSecondary,
                            gradient: AppColor.kGradient,
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                              ),
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 60,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 232, 244, 16),
                                    Color.fromARGB(255, 238, 183, 65),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: const Center(
                                child: Text("CLAIM"),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/Icons/star.png",
                                        width: 20,
                                        height: 20,
                                      ),
                                      const Text("100"),
                                    ],
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    "BONUS COINS",
                                    style: TextStyle(
                                        fontSize: 10, fontFamily: "Cabin"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "TOURNAMENT",
                  style: TextStyle(
                    color: AppColor.kAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: GamesList.length,
              itemBuilder: (context, index) =>
                  GamesCard(games: GamesList[index]),
            ),
          ],
        ),
      ),
    );
  }
}
