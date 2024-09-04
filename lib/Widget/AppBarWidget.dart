import 'package:cash_point/AppColor.dart';
import 'package:cash_point/view/Screens/Games/SpinWinScreen.dart';
import 'package:cash_point/view/Screens/WalletScreen.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.kSecondary.withAlpha(150),
      automaticallyImplyLeading: false,
      title: Text(title),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Spinwinscreen()));
          },
          child: Image.asset(
            "assets/Icons/fortune-wheel.png",
            width: 30,
            height: 30,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WalletScreen()));
            },
            child: Container(
              width: 70,
              height: 35,
              decoration: BoxDecoration(
                color: AppColor.kMain,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "0",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/Icons/star.png",
                    width: 20,
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
