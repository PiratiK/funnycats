import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final Color color;
  const HomeButton({
    Key? key,
    this.onTap,
    this.label = '',
    this.color = Colors.lightGreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: VxBox(
          child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )).alignCenter.width(150).height(50).color(color).makeCentered(),
    );
  }
}
