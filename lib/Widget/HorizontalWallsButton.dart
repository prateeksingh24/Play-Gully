import 'package:flutter/material.dart';

class Horizontalwallsbutton extends StatefulWidget {
  final String title;
  final String image;
  final Color color;

  const Horizontalwallsbutton({
    super.key,
    required this.title,
    required this.image,
    required this.color,
  });

  @override
  State<Horizontalwallsbutton> createState() => _HorizontalwallsbuttonState();
}

class _HorizontalwallsbuttonState extends State<Horizontalwallsbutton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Image.asset(
            widget.image,
            width: 20,
            height: 20,
            color: widget.color,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            widget.title, // Use the title passed in the constructor
            style: TextStyle(
              letterSpacing: 1.5,
              fontSize: 16,
              color: widget.color,
            ),
          ),
        ],
      ),
    );
  }
}
