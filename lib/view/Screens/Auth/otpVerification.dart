import 'dart:async';

import 'package:cash_point/AppColor.dart';
import 'package:cash_point/view/Home.dart';
import 'package:cash_point/view/Screens/Auth/ReferCodePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  TextEditingController otpController = TextEditingController();
  bool isResendActive = false;
  int resendCountdown = 60;
  Timer? countdownTimer;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    countdownTimer?.cancel();
    super.dispose();
  }

  void startResendCountdown() {
    setState(() {
      isResendActive = false;
      resendCountdown = 60;
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendCountdown--;
        if (resendCountdown == 0) {
          timer.cancel();
          isResendActive = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColor.kMain,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: Container(
                height: 300,
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
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Enter Your OTP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller: otpController,
                          style: const TextStyle(color: Colors.black),
                          cursorColor: Colors.black38,
                          maxLength: 5,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Enter OTP',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: isResendActive
                              ? () {
                                  startResendCountdown();
                                }
                              : null, // Initially inactive
                          child: !isResendActive && resendCountdown == 60
                              ? const Text(
                                  "Resend Code",
                                  style: TextStyle(
                                      color: Colors.grey), // Inactive state
                                )
                              : resendCountdown < 60 && resendCountdown > 0
                                  ? Text(
                                      "Resend in $resendCountdown sec",
                                      style: const TextStyle(
                                          color: Colors
                                              .grey), // Timer text during countdown
                                    )
                                  : const Text(
                                      "Resend Code",
                                      style:
                                          TextStyle(), // Active state after countdown
                                    ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          startResendCountdown();
                          Get.to(() => const HomePage());
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: AppColor.kGradient2,
                            border: const GradientBoxBorder(
                              gradient: LinearGradient(
                                colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                              ),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Center(
                            child: Text(
                              'Verify OTP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cabin'),
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
            top: 100 - keyboardHeight,
            left: 20,
            right: 20,
            child: Image.asset(
              "assets/onboard/otpImg.png",
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
