import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/gamesModel.dart';
import 'package:cash_point/Widget/Buttons/CustomizeButton1.dart';
import 'package:cash_point/view/Screens/Games/Tournament/game1.dart';
import 'package:flutter/material.dart';

class Tournamentcard extends StatelessWidget {
  final GamesModel games;
  const Tournamentcard({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: 105,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            gradient: AppColor.kGradient,
            border: kBorder,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${games.name} - MegaPool",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: "Cabin"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/Icons/rupee.png",
                  width: 45,
                  height: 45,
                ),
                const Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.timer_sharp,
                        ),
                        Text(
                          "05:00 -10:00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: "Cabin"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.group,
                        ),
                        Text(
                          "05:00 -10:00",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontFamily: "Cabin"),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                SizedBox(
                  height: 35,
                  child: Customizebutton1(
                      text: "Join",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Game1()));
                      }),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
