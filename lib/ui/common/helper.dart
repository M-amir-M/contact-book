import 'package:flutter/material.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
class UIHelper {
  
  // Horizontal padding
  static double paddingXLarge = 32;
  static double paddingLarge = 16;
  static double paddingMedium = 8;
  static double paddingSmall = 4;
  static double paddingXSmall = 2;

  // Radius
  static double primaryRadius = 8;
  static double secondrayRadius = 16;

  // Vertical spacing constants. Adjust to your liking.
  static double _VerticalSpaceXSmall = 2;
  static double _VerticalSpaceSmall = 4;
  static double _VerticalSpaceMedium = 8;
  static double _VerticalSpaceLarge = 16;
  static double _VerticalSpaceXLarge = 32;

  // Vertical spacing constants. Adjust to your liking.
  static double _HorizontalSpaceXSmall = 2;
  static double _HorizontalSpaceSmall = 4;
  static double _HorizontalSpaceMedium = 8;
  static double _HorizontalSpaceLarge = 16;

  static Widget verticalSpaceXSmall = SizedBox(height: _VerticalSpaceXSmall);
  static Widget verticalSpaceSmall = SizedBox(height: _VerticalSpaceSmall);
  static Widget verticalSpaceMedium = SizedBox(height: _VerticalSpaceMedium);
  static Widget verticalSpaceLarge = SizedBox(height: _VerticalSpaceLarge);
  static Widget verticalSpaceXLarge = SizedBox(height: _VerticalSpaceXLarge);

  static Widget horizontalSpaceXSmall = SizedBox(width: _HorizontalSpaceXSmall);
  static Widget horizontalSpaceSmall = SizedBox(width: _HorizontalSpaceSmall);
  static Widget horizontalSpaceMedium = SizedBox(width: _HorizontalSpaceMedium);
  static Widget horizontalSpaceLarge = SizedBox(width: _HorizontalSpaceLarge);

}
