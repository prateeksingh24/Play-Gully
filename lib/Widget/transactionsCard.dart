import 'package:cash_point/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
            children: [
              CircleAvatar(
                  radius: 18,
                  child: Image.asset(
                    "assets/Icons/star.png",
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Withdrawal of 1000",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    Text("ID : 238rt32gr8732b7b327",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Cabin",
                        )),
                    Text("Date : 2023-3-22 | 1:54:19 PM",
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Cabin",
                        )),
                  ],
                ),
              ),
              const Text("+ ₹ 1000",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff7AEC83),
                  )),
            ],
          )),
    );
  }
}
