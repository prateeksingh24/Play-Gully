import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Widget/profileListCard.dart';
import 'package:cash_point/constant.dart';
import 'package:cash_point/view/Screens/walletScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lottie/lottie.dart';

import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kMain,
      appBar: AppBar(
        backgroundColor: AppColor.kSecondary.withAlpha(150),
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          const Text(
            "Logout",
            style: TextStyle(fontSize: 16),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 30, bottom: 20),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/2059/2059570.png",
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UserW6272",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'Cabin'),
                      ),
                      Text(
                        "htaaybsh@gmail.com",
                        style: TextStyle(fontFamily: 'Cabin'),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width - 50,
                height: 180,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.yellow),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 238, 226, 55),

                        Color.fromARGB(255, 231, 146, 34), // End color
                      ],

                      begin: Alignment.topLeft,
                      // Gradient starts from the top left
                      end: Alignment
                          .bottomRight, // Gradient ends at the bottom right
                    ),
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 70,
                      child: Lottie.asset("assets/lottie/trophy.json"),
                    ),
                    Column(
                      children: [
                        Image.asset(
                          'assets/Icons/rupee.png',
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          "Win Amount",
                          style: TextStyle(
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Text("Minimum Withdrawl: ₹10",
                            style:
                                TextStyle(fontSize: 13, fontFamily: 'Cabin')),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.purple)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const WalletScreen()));
                            },
                            child: const Text(
                              "WITHDRAW",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cabin'),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 180,
                width: width,
                decoration: BoxDecoration(
                    gradient: AppColor.kGradient,
                    border: kBorder,
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Invite & Earn",
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w800),
                    ),
                    const Flexible(
                      flex: 2,
                      child: Text(
                        "Invite your friends with your referral code and earn cash",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 40, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 60,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 107, 3, 212),
                                    Color.fromARGB(255, 71, 16, 119)
                                  ],
                                ),
                                width: 2,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                referralCode,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: 'Cabin',
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Share.share(
                                  'check out my website https://example.com');
                            },
                            child: Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: AppColor.kGradient2,
                                borderRadius: BorderRadius.circular(20),
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xfffbaf0c),
                                      Color(0xfffbaf0c)
                                    ],
                                  ),
                                  width: 2,
                                ),
                              ),
                              child: const Center(
                                child: Text("Invite",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Cabin')),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ProfileListCard(
                    text: "Rate Us",
                    leading: Icons.star_border,
                    trailing: Icons.arrow_forward_ios,
                    onTap: () {}),
                ProfileListCard(
                    text: "Join Our Telegram Group",
                    leading: Icons.telegram,
                    trailing: Icons.open_in_new,
                    onTap: () {}),
                ProfileListCard(
                    text: "Support & Faq",
                    leading: Icons.help,
                    trailing: Icons.arrow_forward_ios,
                    onTap: () {}),
                ProfileListCard(
                    text: "Privacy Policy",
                    leading: Icons.lock,
                    trailing: Icons.open_in_new,
                    onTap: () {}),
                ProfileListCard(
                    text: "Terms & Conditions",
                    leading: Icons.edit_document,
                    trailing: Icons.open_in_new,
                    onTap: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
