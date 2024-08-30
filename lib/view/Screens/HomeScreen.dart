import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Data/GameList.dart';
import 'package:cash_point/Data/OfferWallData.dart';
import 'package:cash_point/Data/dematOffer.dart';
import 'package:cash_point/Data/registerOfferData.dart';
import 'package:cash_point/Widget/AppBarWidget.dart';
import 'package:cash_point/Widget/CustomBox1.dart';
import 'package:cash_point/Widget/EarnMoreCard.dart';
import 'package:cash_point/Widget/GamesCard.dart';
import 'package:cash_point/Widget/HorizontalWallsButton.dart';
import 'package:cash_point/Widget/OfferWallesContainer.dart';
import 'package:cash_point/Widget/spinwheel.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'OfferWalls'; // Track the selected main category
  String selectedSubCategory = 'Banking'; // Track the selected subcategory

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.kMain,
      appBar: const AppBarWidget(title: "CASHPOINT"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.fire,
                    size: 18,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Earn Money",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: dematOfferData.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return EarnMoreCard(offer: dematOfferData[index]);
                },
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Custombox1(
                  image: "assets/Icons/giftbox.png",
                  price: '100',
                  title: 'DAILY BONUS',
                ),
                Custombox1(
                  image: 'assets/Icons/trophy.png',
                  price: '500',
                  title: 'CASHOUT',
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: width,
              height: 40,
              decoration: BoxDecoration(
                color: AppColor.kSecondary,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCategoryButton(
                      'OfferWalls', 'assets/Icons/extension.png'),
                  buildCategoryButton(
                      'SurveyWalls', 'assets/Icons/joystick.png'),
                  buildCategoryButton('Games', 'assets/Icons/games.png'),
                  buildCategoryButton(
                      'Spin and Win', 'assets/Icons/lottery.png'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            _buildSelectedCategoryContainer(),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryButton(String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
          selectedSubCategory = 'Banking'; // Reset to default subcategory
        });
      },
      child: Horizontalwallsbutton(
        title: title,
        image: imagePath,
        color: selectedCategory == title ? Colors.white : Colors.grey,
      ),
    );
  }

  Widget _buildSelectedCategoryContainer() {
    switch (selectedCategory) {
      case 'OfferWalls':
        return _offerWalls();
      case 'SurveyWalls':
        return _surveyWalls();
      case 'Games':
        return _games();
      case 'Spin and Win':
        return _spinWin();
      default:
        return Container();
    }
  }

  Widget _offerWalls() {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildSubCategoryButton('Banking'),
              buildSubCategoryButton('Demat'),
              buildSubCategoryButton('Register'),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _buildOfferWallsContent(),
      ],
    );
  }

  Widget buildSubCategoryButton(String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSubCategory = title;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: selectedSubCategory == title
              ? AppColor.kSecondary.withOpacity(0.9)
              : AppColor.kSecondary.withAlpha(120),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildOfferWallsContent() {
    final filteredOfferWalls = offerwall
        .where((offer) =>
            offer.category.toLowerCase() == selectedSubCategory.toLowerCase())
        .toList();

    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      children: List.generate(filteredOfferWalls.length, (index) {
        return Offerwallescontainer(
          offerwall: filteredOfferWalls[index],
        );
      }),
    );
  }

  Widget _buildBankingContent() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      children: List.generate(offerwall.length, (index) {
        return Offerwallescontainer(
          offerwall: offerwall[index],
        );
      }),
    );
  }

  Widget _buildDematContent() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      children: List.generate(dematOfferData.length, (index) {
        return Offerwallescontainer(
          offerwall: offerwall[index],
        );
      }),
    );
  }

  Widget _buildRegisterContent() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      children: List.generate(registerOfferData.length, (index) {
        return Offerwallescontainer(
          offerwall: offerwall[index],
        );
      }),
    );
  }

  Widget _surveyWalls() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8.0),
      children: List.generate(surveyWall.length, (index) {
        return Offerwallescontainer(
          offerwall: surveyWall[index],
        );
      }),
    );
  }

  Widget _games() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: GamesList.length,
      itemBuilder: (context, index) => GamesCard(games: GamesList[index]),
    );
  }

  // Widget _spinWin() {
  //   return GridView.count(
  //     crossAxisCount: 2,
  //     childAspectRatio: 1.2,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     padding: const EdgeInsets.all(8.0),
  //     children: List.generate(spinwinList.length, (index) {
  //       return Offerwallescontainer(
  //         offerwall: spinwinList[index],
  //       );
  //     }),
  //   );
  // }
  Widget _spinWin() {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width - 10,
        child: Spinwheel());
  }
}
