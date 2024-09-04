import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/leaderboardModel.dart';
import 'package:cash_point/Widget/leaderboardCard.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final List<Leaderboardmodel> todayLeaderboard = [
    Leaderboardmodel(
        name: "Prateek",
        rank: 2,
        price: 1000,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/2059/2059570.png'),
    Leaderboardmodel(
        name: "Abhishek",
        rank: 1,
        price: 2000,
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg'),
    Leaderboardmodel(
        name: "Abhishek",
        rank: 3,
        price: 500,
        imageUrl:
            'https://static.vecteezy.com/system/resources/thumbnails/002/002/403/small_2x/man-with-beard-avatar-character-isolated-icon-free-vector.jpg'),
    Leaderboardmodel(
        name: "Rahul",
        rank: 4,
        price: 3000,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/206/206895.png'),
    Leaderboardmodel(
        name: "Sneha",
        rank: 5,
        price: 1500,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/206/206875.png'),
    Leaderboardmodel(
        name: "Neha",
        rank: 7,
        price: 800,
        imageUrl: 'https://cdn-icons-png.flaticon.com/512/206/206885.png'),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // Sort the leaderboard by rank
    todayLeaderboard.sort((a, b) => a.rank.compareTo(b.rank));

    // Extract top 3 ranks
    final topThree = todayLeaderboard.take(3).toList();
    final restOfTheRanks = todayLeaderboard.skip(3).toList();

    return Scaffold(
      backgroundColor: AppColor.kMain,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            width: width,
            height: 470,
            decoration: BoxDecoration(
              gradient: AppColor.kGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColor.kMain.withOpacity(0.3),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.arrow_circle_left_outlined,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        "LeaderBoard",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // 2nd Position
                    Expanded(
                      child: LeaderboardCard2(
                          leaderboard: topThree[1], rankColor: Colors.grey),
                    ),
                    // 1st Position
                    Expanded(
                      child: LeaderboardCard2(
                          leaderboard: topThree[0], rankColor: Colors.amber),
                    ),
                    // 3rd Position
                    Expanded(
                      child: LeaderboardCard2(
                          leaderboard: topThree[2], rankColor: Colors.brown),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: restOfTheRanks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) =>
                  Leaderboardcard(leaderbord: restOfTheRanks[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaderboardCard2 extends StatelessWidget {
  final Leaderboardmodel leaderboard;
  final Color rankColor;

  const LeaderboardCard2({
    super.key,
    required this.leaderboard,
    required this.rankColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (leaderboard.rank == 1)
          Image.asset(
            "assets/Icons/king.png",
            width: 40,
            height: 40,
          ),
        CircleAvatar(
          radius: leaderboard.rank == 1 ? 70 : 60,
          backgroundColor: Colors.transparent,
          child: ClipOval(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.network(
              leaderboard.imageUrl,
              width: leaderboard.rank == 1 ? 120 : 110,
              height: leaderboard.rank == 1 ? 120 : 110,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height:
              leaderboard.rank == 1 ? 180 : (leaderboard.rank == 2 ? 150 : 135),
          decoration: BoxDecoration(
            color: AppColor.kSecondary,
            border: Border(
              top: BorderSide(
                width: 5,
                color: AppColor.kMain.withOpacity(0.3),
              ),
              right: BorderSide(width: 8, color: AppColor.kMain),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                leaderboard.name,
                style: TextStyle(fontSize: 20, color: rankColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    leaderboard.price.toString(),
                    style: const TextStyle(fontSize: 17),
                  ),
                  Image.asset(
                    "assets/Icons/star.png",
                    width: 22,
                    height: 22,
                  ),
                ],
              ),
              Container(
                height: leaderboard.rank == 1
                    ? 70
                    : (leaderboard.rank == 2 ? 60 : 55),
                width: leaderboard.rank == 1
                    ? 70
                    : (leaderboard.rank == 2 ? 60 : 55),
                decoration: BoxDecoration(
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                      colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                    ),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: Text(
                    leaderboard.rank.toString(),
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
