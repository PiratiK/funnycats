import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HistoryCard extends StatelessWidget {
  final String text;
  final double height;
  const HistoryCard({
    Key? key,
    required this.text,
    this.height = 40.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: AutoSizeText(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.yellow,
        ),
      ),
    ).width(context.percentWidth * 80.0).height(height).p12.makeCentered();
  }
}
