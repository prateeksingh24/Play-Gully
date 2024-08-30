import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Widget/transactionsCard.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.kMain,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: width,
              height: 280,
              decoration: BoxDecoration(
                  color: AppColor.kSecondary,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
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
                      const Center(
                        child: Text(
                          "Wallet",
                          style: TextStyle(fontSize: 26, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.grey[300],
                      child: Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 10, top: 20),
                          width: width,
                          height: 180,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Available Balance",
                                    style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 1,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "₹0.00",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const PaymentPage()));
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          gradient: AppColor.kGradient,
                                          border: Border.all(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Center(
                                        child: Text(
                                          "Withdraw Money",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: "Cabin",
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Lottie.asset("assets/lottie/wallet.json",
                                    width: 180, height: 180),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Recent Transactions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 1.2),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const TransactionCard();
                  },
                ),
              ),
            )

            // const SizedBox(height: 20),
            // Display demo content based on the selected index
          ],
        ),
      ),
    );
  }
}
