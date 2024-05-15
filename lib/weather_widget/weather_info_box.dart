import 'package:flutter/material.dart';

class WeatherInfoBox extends StatelessWidget {
  const WeatherInfoBox(
      {super.key,
      this.width = 400,
      this.height = 280,
      this.color = Colors.white,
      required this.child});
  final double width;
  final double height;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
