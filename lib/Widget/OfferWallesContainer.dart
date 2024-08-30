import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Model/OfferWallsModel.dart';
import 'package:cash_point/view/Screens/OffersWalls/OfferDetails.dart';
import 'package:flutter/material.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';

class Offerwallescontainer extends StatelessWidget {
  final OfferWallsModel offerwall;
  const Offerwallescontainer({super.key, required this.offerwall});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OfferDetailsPage(offer: offerwall)));
      },
      child: Container(
        margin: const EdgeInsets.all(4.0),
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          gradient: AppColor.kGradient,
          border: const GradientBoxBorder(
            gradient: LinearGradient(
              colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
            ),
            width: 0.1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 30,
                child: Image.network(
                  offerwall.imageUrl,
                ),
              ),
            ),
            Expanded(
              child: Text(
                offerwall.name,
                style: const TextStyle(fontSize: 17, color: Colors.white),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.readOnly(
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    initialRating: offerwall.rating,
                    maxRating: 5,
                    size: 16,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/Icons/star.png",
                        width: 20,
                        height: 20,
                      ),
                      Text("${offerwall.money.toString()}K"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
