import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/OfferModel.dart';
import 'package:flutter/material.dart';

class EarnMoreCard extends StatelessWidget {
  final OfferModel offer;

  const EarnMoreCard({
    super.key,
    required this.offer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.kSecondary.withOpacity(0.4),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 2, right: 2),
        width: 140,
        decoration: BoxDecoration(
          color: AppColor.kSecondary,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white, // White background for the image
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    offer.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(offer.appName),
            const SizedBox(
              height: 5,
            ),

            const Text(
              "Get the app Dowload from ths xyzj jjsjnkns",
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              style: TextStyle(
                  fontFamily: "Cabin", fontSize: 12, color: Colors.white60),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60,
                  height: 20,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(fontFamily: "Cabin", fontSize: 12),
                    ),
                  ),
                ),
                Text(offer.price.toString()),
              ],
            )
            // You can add other elements here, such as offer name or price
          ],
        ),
      ),
    );
  }
}
