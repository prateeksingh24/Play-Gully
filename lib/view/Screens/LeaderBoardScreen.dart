import 'package:cash_point/AppColor.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kMain,
      appBar: AppBar(
        title: Text("Leaderboard"),
        backgroundColor: AppColor.kMain,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                height: 380,
                width: width,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 125,
                      child: CircleAvatar(
                        radius: 50,
                        child: Image.asset("assets/Icons/gamer.png"),
                      ),
                    ), //1
                    const Positioned(
                        top: 100,
                        left: 18,
                        child: CircleAvatar(
                          radius: 45,
                        )), //2
                    const Positioned(
                        top: 110,
                        right: 18,
                        child: CircleAvatar(
                          radius: 45,
                        )), //3
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        "assets/Icons/podium.png",
                        width: width,
                        height: 300,
                        color: AppColor.kSecondary,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
