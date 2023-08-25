import 'package:contact_book/ui/common/app_theme.dart';
import 'package:contact_book/ui/widgets/skeleton/skeleton_tools.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ContactListSkeleton extends StatelessWidget {
  final Color? color;
  final double height;
  const ContactListSkeleton({this.color, this.height = 70});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
          child: LineSkeletonStackUser(
            color: color,
            height: height,
          ),
        );
      },
    );
  }
}

class LineSkeletonStackUser extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets margin;
  final Color? color;
  final double borderRadius;

  LineSkeletonStackUser({
    this.width = double.infinity,
    this.height = 85,
    this.color,
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    Color baseColor = color ?? AppThemeData.skeletonSecondaryColor;

    double heightItem = 25;

    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          clipBehavior: Clip.antiAlias,
          margin: margin,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            color: baseColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  LineSkeletonBasic(
                    height: 60,
                    width: 60,
                    borderRadius: 100,
                  ),
                ],
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LineSkeletonBasic(
                    height: heightItem,
                    width: 160,
                  ),
                  SizedBox(height: 5,),
                  LineSkeletonBasic(
                    height: heightItem / 2,
                    width: 70,
                  ),
                ],
              ),
              Spacer(),
              LineSkeletonBasic(
                height: heightItem,
                width: 30,
              ),
            ],
          ),
        ),
        Shimmer.fromColors(
          baseColor: color ?? AppThemeData.skeletonBaseColor.withOpacity(0.5),
          highlightColor: AppThemeData.skeletonHighlightColor,
          child: Container(
            height: height,
            width: width,
            margin: margin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
