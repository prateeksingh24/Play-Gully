import 'package:cash_point/AppColor.dart';
import 'package:cash_point/view/Screens/Auth/otpVerification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ReferCodePage extends StatefulWidget {
  const ReferCodePage({super.key});

  @override
  State<ReferCodePage> createState() => _ReferCodePageState();
}

class _ReferCodePageState extends State<ReferCodePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // Start off the screen
      end: Offset.zero, // End at the position of the screen
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine the height of the keyboard
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.kMain, // Make sure this color is correct
      body: Stack(
        children: [
          // Your other widgets here, if any
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                height: 350,
                decoration: BoxDecoration(
                    gradient: AppColor.kGradient,
                    border: const Border(
                      top: BorderSide(
                        color: Color(0xfffbaf0c),
                        width: 0.5,
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'ENTER REFER CODE',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black38,
                          decoration: InputDecoration(
                            filled: true, // Enables the background color
                            fillColor: Colors
                                .grey[200], // Sets the background color to grey
                            hintText: 'Enter Refer Code',

                            hintStyle: TextStyle(
                                color: Colors.grey[
                                    600]), // Optional: Customize hint text color
                            prefixIcon: Icon(Icons.code,
                                color: Colors.grey[600]), // Icon on the left
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Optional: Rounded corners
                              borderSide: BorderSide.none, // Removes the border
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Optional: Rounded corners
                              borderSide: BorderSide(
                                color: Colors.grey[300]!, // Divider color
                                width: 1.0, // Divider width
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Optional: Rounded corners
                              borderSide: BorderSide(
                                color: Colors
                                    .grey[400]!, // Divider color when focused
                                width: 1.0, // Divider width
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: InkWell(
                            onTap: () => Get.to(() => const OtpVerification()),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                gradient: AppColor.kGradient2,
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xfffbaf0c),
                                      Color(0xfffbaf0c)
                                    ],
                                  ),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cabin'),
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () => Get.to(() => const ReferCodePage()),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColor.kMain,
                              border: const GradientBoxBorder(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 152, 3, 193),
                                    Color.fromARGB(255, 66, 4, 158)
                                  ],
                                ),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Center(
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Cabin'),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120 - keyboardHeight, // Adjust based on keyboard height
            left: 20,
            right: 20,
            child: Image.asset(
              "assets/onboard/onboard2.png",
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
