import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/gamesModel.dart';
import 'package:cash_point/Widget/tournamentCard.dart';
import 'package:flutter/material.dart';

class Alltournamentscreen extends StatelessWidget {
  final GamesModel games;
  const Alltournamentscreen({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Select Tournament To Join",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Tournamentcard(games: games);
              },
            ),
          )
        ],
      ),
    );
  }
}
