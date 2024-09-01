
import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Widget/MyReferralsCard.dart';
import 'package:flutter/material.dart';

class MyReferrals extends StatelessWidget {
  const MyReferrals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_circle_left_outlined,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColor.kMain,
        title: const Text(
          'My Referrals',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return Myreferralscard();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
