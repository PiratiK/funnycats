import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  const HomeButton({Key? key, this.onTap, this.label = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: VxBox(
          child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16.0),
      )).alignCenter.width(150).height(50).green300.makeCentered(),
    );
  }
}
