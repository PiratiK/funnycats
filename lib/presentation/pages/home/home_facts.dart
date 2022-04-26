import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/decoding_text.dart';

class HomeFacts extends StatelessWidget {
  final String text;
  const HomeFacts({Key? key, this.text = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: DecodingTextEffect(
        text,
        decodeEffect: DecodeEffect.fromStart,
        refreshDuration: const Duration(milliseconds: 1),
        textStyle: const TextStyle(
          fontSize: 24.0,
          color: Colors.amber,
        ),
        textAlign: TextAlign.center,
      ),
    )
        .width(context.percentWidth * 90.0)
        .height(context.percentHeight * 20.0)
        .p16
        .makeCentered();
  }
}
