// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cash_point/AppColor.dart';

import 'package:cash_point/Model/OfferWallsModel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import 'package:url_launcher/url_launcher.dart';

class OfferDetailsPage extends StatefulWidget {
  final OfferWallsModel offer;
  const OfferDetailsPage({
    Key? key,
    required this.offer,
  }) : super(key: key);

  @override
  State<OfferDetailsPage> createState() => _OfferDetailsPageState();
}

class _OfferDetailsPageState extends State<OfferDetailsPage> {
  final String referralCode = "C7FJKI67";

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
  Future<void> _shareContent() async {
    final Uri _url =
        Uri.parse('https://www.pub.dev'); // Example URL or content to share
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kSecondary.withOpacity(0.8),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_circle_left_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                widget.offer.name,
                style: const TextStyle(fontSize: 26, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 120,
            decoration: BoxDecoration(
                color: AppColor.kMain.withOpacity(0.8),
                border: kBorder,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                Image.network(
                  widget.offer.imageUrl,
                  width: 200,
                  height: 150,
                ),
                Text(
                  "Offers Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 4,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: AppColor.kGradient,
                        borderRadius: BorderRadius.circular(10),
                        border: kBorder,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Complete Offer and Get Free Money",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Cabin",
                              fontSize: 17,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "₹${widget.offer.money}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 54, 217, 59),
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      width: MediaQuery.of(context).size.width,
                      height: 130,
                      decoration: BoxDecoration(
                        gradient: AppColor.kGradient,
                        borderRadius: BorderRadius.circular(10),
                        border: kBorder,
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.task),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Task Details",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17,
                                    fontFamily: "Cabin"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1. Dowmload App\n2. Open App and Register\n3. Done You Get Your Task Money",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                fontFamily: "Cabin"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          color: AppColor.kMain,
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                            ),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          "Share To Get Extra",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Cabin",
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          gradient: AppColor.kGradient2,
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                            ),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(30)),
                      child: const Center(
                        child: Text(
                          "Install Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Cabin",
                              fontSize: 17,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
