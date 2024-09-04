import 'package:cash_point/AppColor.dart';
import 'package:cash_point/constant.dart';
import 'package:cash_point/view/Screens/MyReferrals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class ReferScreen extends StatefulWidget {
  const ReferScreen({super.key});

  @override
  State<ReferScreen> createState() => _ReferScreenState();
}

class _ReferScreenState extends State<ReferScreen> {

  bool iscopied = false;

  Future<void> _openWhatsApp() async {
    final String message =
        "Check out this amazing app I just found! Use Code = $referralCode";
    final String url = "https://wa.me/?text=${Uri.encodeComponent(message)}";
    final Uri _url = Uri.parse(url);

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  // Function to open Share dialog
  // Future<void> _shareContent() async {
  //   final Uri _url =
  //       Uri.parse('https://www.pub.dev'); // Example URL or content to share
  //   if (await canLaunchUrl(_url)) {
  //     await launchUrl(_url);
  //   } else {
  //     throw 'Could not launch $_url';
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kSecondary.withAlpha(150),
      body: Column(
        children: [
          const SizedBox(height: 40),
          const Center(
            child: Text(
              'Refer and Earn',
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColor.kMain,
                  border: Border(
                    top: BorderSide(color: AppColor.kSecondary, width: 2),
                  ),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/lottie/refer.json',
                    width: 220,
                    height: 220,
                  ),
                  const Text(
                    "Earn Upto 10% Commison",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 106, 32, 196))),
                    child: Center(
                      child: GestureDetector(
                        onLongPress: () {
                          // Copy the text to the clipboard
                          Clipboard.setData(
                            const ClipboardData(text: referralCode),
                            // Show a snackbar or toast to inform the user
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(
                            //     content: Text('Text copied to clipboard'),
                            //     behavior: SnackBarBehavior
                            //         .floating, // Ensures the snackbar floats above other widgets
                            //     // margin: EdgeInsets.only(
                            //     //   bottom:
                            //     //       MediaQuery.of(context).viewInsets.bottom +
                            //     //           10, // Adjust margin to avoid overlap
                            //     // ),
                            //   ),
                          );
                          setState(() {
                            iscopied = !iscopied;
                          });
                        },
                        child: const Text(
                          referralCode,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: "Cabin"),
                        ),
                      ),
                    ),
                  ),
                  iscopied
                      ? const Text(
                          "Copied",
                          style: TextStyle(fontFamily: "Cabin"),
                        )
                      : const Text(
                          "Tap to Copy",
                          style: TextStyle(fontFamily: "Cabin"),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: _openWhatsApp,
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 107, 3, 212),
                                    Color.fromARGB(255, 71, 16, 119)
                                  ],
                                ),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // HugeIcon(
                              //   icon: HugeIcons.strokeRoundedWhatsapp,
                              //   color: Colors.green,
                              //   size: 30.0,
                              // ),
                              FaIcon(
                                FontAwesomeIcons.whatsapp,
                                size: 30,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Whatsapp",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Cabin",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          const url = "https://www.youtube.com";
                          await Share.share(
                              "Check out this amazing app I just found! Use Code = $referralCode \nDownload the app $url ",
                              subject: "Download");
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                              color: AppColor.kMain,
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 107, 3, 212),
                                    Color(0xfffbaf0c)
                                  ],
                                ),
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Share Others",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: "Cabin",
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 15),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "How do you earn?",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                                width:
                                    8), // Adds spacing between the icon and text
                            const Expanded(
                              child: Text(
                                "Your Friend installs Insta Rewards and signs up using your referral code",
                                style: TextStyle(
                                    fontFamily: "Cabin",
                                    fontSize: 13), // Adjust font size as needed
                                softWrap: true, // Allows text to wrap
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8), // Adds spacing between the rows
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.offline_bolt_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "Your Friend Completes any offers, you get up to 10% Commission. Tell Your Friend to complete higher amount offers to get more Commission",
                                style: TextStyle(
                                    fontFamily: "Cabin", fontSize: 13),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyReferrals()));
                    },
                    child: Container(
                      height: 50,
                      width: 250,
                      decoration: BoxDecoration(
                          gradient: AppColor.kGradient2,
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                            ),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          "My Referrals",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
