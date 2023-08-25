import 'package:flutter/material.dart';
class LineSkeletonBasic extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  final Color? color;
  final double borderRadius;

  LineSkeletonBasic({
    this.width = double.infinity,
    this.height = 15,
    this.color,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        color: Colors.white,
      ),
    );
  }
}