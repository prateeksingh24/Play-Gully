import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/leaderboardModel.dart';
import 'package:flutter/material.dart';

import '../../../Widget/leaderboardCard.dart';

class LeaderBordScreen extends StatefulWidget {
  const LeaderBordScreen({super.key});

  @override
  State<LeaderBordScreen> createState() => _LeaderBordScreenState();
}

class _LeaderBordScreenState extends State<LeaderBordScreen> {
  bool isTodaySelected = true;

  final List<Leaderboardmodel> todayLeaderboard = [
    Leaderboardmodel(
        name: "Abhishek",
        rank: 1,
        price: 2000,
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg'),
    Leaderboardmodel(
        name: "Prateek",
        rank: 2,
        price: 1000,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/2059/2059570.png'),
    Leaderboardmodel(
        name: "Abhishek",
        rank: 3,
        price: 500,
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg'),
  ];

  final List<Leaderboardmodel> yesterdayLeaderboard = [
    Leaderboardmodel(
        name: "Rahul",
        rank: 1,
        price: 3000,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/206/206895.png'),
    Leaderboardmodel(
        name: "Sneha",
        rank: 2,
        price: 1500,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/206/206875.png'),
    Leaderboardmodel(
        name: "Neha",
        rank: 3,
        price: 800,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/206/206885.png'),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final leaderboard =
        isTodaySelected ? todayLeaderboard : yesterdayLeaderboard;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.kMain,
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "LeaderBoard",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTodaySelected = true;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                        color: isTodaySelected
                            ? Colors.green
                            : Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        "Today",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTodaySelected = false;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 35,
                    decoration: BoxDecoration(
                        color: !isTodaySelected
                            ? Colors.green
                            : Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(30)),
                    child: const Center(
                      child: Text(
                        "Yesterday",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              height: 40,
              color: Colors.grey.withOpacity(0.3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Rank",
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                  Text(
                    "Price",
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: leaderboard.length,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    Leaderboardcard(leaderbord: leaderboard[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
