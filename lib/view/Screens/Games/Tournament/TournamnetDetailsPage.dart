import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/gamesModel.dart';
import 'package:cash_point/view/Screens/Games/Tournament/game1.dart';
import 'package:flutter/material.dart';

class TournamentDetailsPage extends StatelessWidget {
  final GamesModel games;
  const TournamentDetailsPage({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.kMain,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  games.imageUrl,
                  width: 60,
                  height: 60,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              games.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width,
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "MEGAPOOL",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Cabin",
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/Icons/rupee.png",
                            width: 40,
                            height: 40,
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer_sharp,
                                color: Colors.black,
                              ),
                              Text(
                                "05:00 -10:00",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Cabin",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.group,
                                color: Colors.black,
                              ),
                              Text(
                                "05:00 -10:00",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Cabin",
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(AppColor.kAppBar),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Game1()));
                          },
                          child: const Text("Join"))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
