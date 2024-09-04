import 'package:cash_point/AppColor.dart';
import 'package:flutter/material.dart';

class ProfileListCard extends StatelessWidget {
  final String text;
  final IconData leading;
  final IconData trailing;
  final VoidCallback onTap;
  const ProfileListCard(
      {super.key,
      required this.text,
      required this.leading,
      required this.trailing,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      shadowColor: AppColor.kMain,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            gradient: AppColor.kGradient,
            borderRadius: BorderRadius.circular(15)),
        child: ListTile(
            title: Text(
              text,
              style: const TextStyle(
                  fontWeight: FontWeight.w500, fontFamily: "Cabin"),
            ),
            leading: Icon(
              leading,
            ),
            trailing: IconButton(
              onPressed: onTap,
              icon: Icon(
                trailing,
              ),
            )),
      ),
    );
  }
}
