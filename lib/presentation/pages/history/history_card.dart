import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'history_text.dart';

class HistoryCard extends StatelessWidget {
  final String text;
  final String date;
  const HistoryCard({
    Key? key,
    required this.text,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: VStack(
        [
          HistoryText(
            text: date,
          ),
          const Divider(
            height: 2.0,
            thickness: 2.0,
            indent: 10.0,
            endIndent: 10.0,
            color: Colors.blue,
          ),
          HistoryText(
            text: text,
            height: 140.0,
          )
        ],
      ).card.color(Colors.black54).make(),
    ).width(context.percentWidth * 90.0).makeCentered();
  }
}
