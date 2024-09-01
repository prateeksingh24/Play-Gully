
import 'package:cash_point/AppColor.dart';
import 'package:flutter/material.dart';

class Myreferralscard extends StatelessWidget {
  const Myreferralscard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 90,
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColor.kMain,
                radius: 20,
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/2059/2059570.png",
                ),
              ),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Prateek Singh", style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              Text("₹ 1000",
                  style: TextStyle(
                      fontSize: 22,
                      color: Colors.green.shade500,
                      fontWeight: FontWeight.bold)),
            ],
          )),
    );
  }
}
