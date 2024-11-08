import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:cash_point/AppColor.dart';
import 'package:cash_point/Widget/Buttons/CustomizeButton1.dart';
import 'package:cash_point/Widget/winnigCeleb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class Spinwheel extends StatefulWidget {
  const Spinwheel({
    super.key,
  });

  @override
  State<Spinwheel> createState() => _SpinwheelState();
}

class _SpinwheelState extends State<Spinwheel> {
  int count = 3;
  List<String> item = [
    "assets/Icons/remove.png",
    "assets/Icons/star.png",
    "assets/Icons/remove.png",
    "assets/Icons/trophy.png",
    "assets/Icons/remove.png",
    "assets/Icons/rupee.png",
    "assets/Icons/remove.png",
    "assets/Icons/giftbox.png",
  ];
  StreamController<int> controller = StreamController<int>();
  int? outcome;
  @override
  void dispose() {
    super.dispose();
    _audioPlayer.dispose();
    controller.close();
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          height: 70,
          width: 150,
          decoration: BoxDecoration(
              gradient: AppColor.kGradient,
              border: const GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [Color(0xfffbaf0c), Color(0xfffbaf0c)],
                ),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Available Spin",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "$count",
                style: const TextStyle(color: Colors.amber, fontSize: 18),
              )
            ],
          ),
        ),
        Expanded(
          child: FortuneWheel(
            selected: controller.stream,
            animateFirst: false,
            duration: const Duration(seconds: 5),
            hapticImpact: HapticImpact.medium,
            indicators: const [
              FortuneIndicator(
                alignment: Alignment.topCenter,
                child: TriangleIndicator(
                  color: Colors.amber,
                  width: 30.0,
                  height: 40.0,
                  elevation: 10,
                ),
              ),
            ],
            items: [
              ..._losing90(imagePath: item, color: Colors.white.withAlpha(150)),
            ],
            // onFling: () {
            //   int listLength = item.length;
            //   List<int> outcomes =
            //       List<int>.generate(listLength, (index) => index);
            //   outcome = outcomes[Random().nextInt(outcomes.length)];

            //   controller.add(outcome ?? 0);
            // },
            onAnimationEnd: ()  {
               _audioPlayer
                  .stop(); // Stop the spinning sound before doing anything else

              print("OUTCOME: $outcome");

             
              if (outcome!.isOdd) {
                 _audioPlayer.play(
                    AssetSource('audio/winning.mp3')); // Play the winning sound

                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: AppColor.kSecondary,
                    actions: <Widget>[
                      if (outcome != null && outcome! > 0)
                        Image.asset(item[outcome!]),
                      const Winnigceleb(),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
                 _audioPlayer
                    .stop(); // Stop the winning sound after the dialog is shown
              } else {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: AppColor.kSecondary,
                    actions: <Widget>[
                      if (outcome != null && outcome! > 0)
                        Image.asset(item[outcome!]),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        SizedBox(
          height: 40,
          width: 100,
          child: Customizebutton1(
              text: "SPIN",
              onTap: () async {
                if (count > 0) {
                  await _audioPlayer.play(AssetSource('audio/spinning.mp3'));
                  setState(
                    () {
                      int listLength = item.length;
                      List<int> outcomes =
                          List<int>.generate(listLength, (index) => index);
                      outcome = outcomes[Random().nextInt(outcomes.length)];

                      controller.add(outcome ?? 0);
                      count--;
                    },
                  );
                }
              }),
        )
      ],
    );
  }

  List<FortuneItem> _losing90({
    required List imagePath,
    required Color color,
  }) {
    List<FortuneItem> output = [];
    for (var item = 0; item < imagePath.length; item++) {
      output.add(
        FortuneItem(
          child: RotatedBox(
            quarterTurns: 1,
            child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset(
                  imagePath[item],
                  width: 55,
                )),
          ),
          style: FortuneItemStyle(
              color: item % 2 == 0
                  ? Colors.blue.shade800.withAlpha(50)
                  : AppColor.kMain),
        ),
      );
    }
    return output;
  }
}
