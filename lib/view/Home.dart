import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Widget/spinwheel.dart';
import 'package:cash_point/view/Screens/Games/GameScreen.dart';
import 'package:cash_point/view/Screens/Games/SpinWinScreen.dart';
import 'package:cash_point/view/Screens/HomeScreen.dart';

import 'package:cash_point/view/Screens/ReferScreen.dart';
import 'package:cash_point/view/Screens/WalletScreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0; // Current selected index for bottom navigation bar

  // List of icons for the bottom navigation bar
  final iconList = <IconData>[
    Icons.home, // Home screen icon
    Icons.games, // Leaderboard screen icon
    Icons.share, // History screen icon

    Icons.wallet, // Profile screen icon
  ];

  // List of screens corresponding to each icon index
  final List<Widget> _screens = [
    const HomeScreen(), // Home screen
    const GameScreen(),
    const ReferScreen(), // History screen
    // Leaderboard screen
    const WalletScreen(), // Profile screen
  ];
  final List<String> names = [
    "Home",
    "ALl Games",
    "Refer Earn",
    "Wallet",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _screens[
          _bottomNavIndex], // Display the selected screen based on index

      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 50,
        itemCount:
            iconList.length, // Number of items in the bottom navigation bar
        tabBuilder: (int index, bool isActive) {
          return Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Icon(
                iconList[index], // Icon for the current tab
                size: 24,
                color: isActive
                    ? Colors.red
                    : Colors.white, // Active and inactive colors
              ),
              Text(
                names[index],
                style: TextStyle(
                  color: isActive ? Colors.red : Colors.white,
                ),
              )
            ],
          );
        },
        backgroundColor: AppColor.kSecondary.withAlpha(150),
        activeIndex: _bottomNavIndex, // Currently selected index
        gapWidth: 5, // Gap width between items
        onTap: (index) => setState(
            () => _bottomNavIndex = index), // Update selected index on tap
      ),
    );
  }
}
