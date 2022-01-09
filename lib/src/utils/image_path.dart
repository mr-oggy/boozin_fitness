import 'package:boozin_fitness/src/extensions/theme_value.dart';
import 'package:flutter/material.dart';

class ImagePathDark implements ImagePath {
  @override
  String get splashBoozin => "assets/splash_logo/dark/Booz_n.png";
  @override
  String get iconFootSteps => "assets/icons/dark/footsteps.png";
  @override
  String get iconKcal => "assets/icons/dark/kcal.png";
}

class ImagePathLight implements ImagePath {
  @override
  String get splashBoozin => "assets/splash_logo/light/Booz_n.png";
  @override
  String get iconFootSteps => "assets/icons/light/footsteps.png";
  @override
  String get iconKcal => "assets/icons/light/kcal.png";
}

class ImagePathCommon {
  static const String splashI = "assets/splash_logo/i_common.png";
}

/// so the we cannot forent to add data in both the themes
abstract class ImagePath {
  String get splashBoozin;
  String get iconFootSteps;
  String get iconKcal;

  /// so we can use it in any class  without giving any dark and light maode value
  factory ImagePath(BuildContext context) => context.themeValue(
        light: ImagePathLight(),
        dark: ImagePathDark(),
      );
}
