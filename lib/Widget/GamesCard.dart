import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/gamesModel.dart';
import 'package:cash_point/view/Screens/Games/Tournament/allTournamentScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GamesCard extends StatefulWidget {
  final GamesModel games;
  const GamesCard({super.key, required this.games});

  @override
  State<GamesCard> createState() => _GamesCardState();
}

class _GamesCardState extends State<GamesCard> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: width,
        height: 100,
        decoration: BoxDecoration(
            // color: AppColor.kSecondary,
            gradient: AppColor.kGradient,
            border: const GradientBoxBorder(
              gradient: LinearGradient(
                colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
              ),
              width: 0.1,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.games.imageUrl,
                    width: 80,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      widget.games.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "PLAY THIS GAME AND GET ${widget.games.price}",
                      style: const TextStyle(fontSize: 10, fontFamily: "Cabin"),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Icons/star.png",
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(widget.games.price.toString()),
                        const SizedBox(
                          width: 20,
                        ),
                        const FaIcon(
                          FontAwesomeIcons.clock,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${widget.games.time.toString()} MIN",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Alltournamentscreen(
                      games: widget.games,
                    ),
                  ),
                );
              },
              child: Container(
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    // color: Color(0xffC30FFF),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xffC30FFF),
                        Color.fromARGB(255, 41, 23, 70),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: const GradientBoxBorder(
                      gradient: LinearGradient(
                        colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                      ),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text("PLAY")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
