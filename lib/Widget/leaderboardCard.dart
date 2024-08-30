import 'package:cash_point/Model/leaderboardModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Leaderboardcard extends StatelessWidget {
  final Leaderboardmodel leaderbord;
  const Leaderboardcard({super.key, required this.leaderbord});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 7, top: 5),
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    leaderbord.imageUrl,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  leaderbord.name,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "#${leaderbord.rank}",
              style: const TextStyle(color: Colors.black),
            ),
            Row(
              children: [
                FaIcon(FontAwesomeIcons.moneyBill, color: Colors.green),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  leaderbord.price.toString(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
