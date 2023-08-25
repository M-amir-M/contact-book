import 'package:contact_book/ui/common/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LineSkeleton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  final double borderRadius;

  LineSkeleton({
    this.width = double.infinity,
    this.height = 15,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppThemeData.skeletonBaseColor,
      highlightColor: AppThemeData.skeletonHighlightColor,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          color: Colors.green,
        ),
      ),
    );
  }
}

class CircleSkeleton extends StatelessWidget {
  final double size;
  final EdgeInsets margin;

  CircleSkeleton({this.size = 36, this.margin = const EdgeInsets.all(0)});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppThemeData.skeletonBaseColor,
      highlightColor: AppThemeData.skeletonHighlightColor,
      child: Container(
        height: size,
        width: size,
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: Colors.green,
        ),
      ),
    );
  }
}
