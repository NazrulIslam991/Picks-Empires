import 'dart:math' as math;

import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;
  final Size size;
  final TextScaler textScaler;
  final Orientation orientation;

  Responsive._(this.context, this.size, this.textScaler, this.orientation);

  static Responsive of(BuildContext context) {
    final media = MediaQuery.of(context);
    return Responsive._(
      context,
      media.size,
      media.textScaler,
      media.orientation,
    );
  }

  // ===========================================================================
  //  Dimensions (Width & Height)
  // ===========================================================================

  double width(double fraction) => size.width * fraction;

  double height(double fraction) => size.height * fraction;

  double scale(double fraction) => size.shortestSide * fraction;

  // ===========================================================================
  //  Device Type Detection (Breakpoints)
  // ===========================================================================

  bool get isMobile => size.width < 600;
  bool get isTablet => size.width >= 600 && size.width < 1100;
  bool get isDesktop => size.width >= 1100;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  // ===========================================================================
  // 🎛 Generic Helper (সবচেয়ে কাজের ফাংশন)
  // ===========================================================================

  T value<T>({required T mobile, T? tablet, T? desktop}) {
    if (isDesktop) return desktop ?? tablet ?? mobile;
    if (isTablet) return tablet ?? mobile;
    return mobile;
  }

  // ===========================================================================
  //  Font Scale (Adaptive Typography)
  // ===========================================================================

  double fontExtraSmall() => _adaptiveFont(0.028);
  double fontSmall() => _adaptiveFont(0.032);
  double fontMedium() => _adaptiveFont(0.038);
  double fontLarge() => _adaptiveFont(0.045);
  double fontXL() => _adaptiveFont(0.055);
  double fontXXL() => _adaptiveFont(0.070);
  double fontXXXL() => _adaptiveFont(0.085);

  double _adaptiveFont(double fraction) {
    double baseSize = size.shortestSide * fraction;

    if (isTablet) baseSize *= 0.9;
    if (isDesktop) baseSize *= 0.8;

    double scaleFactor = textScaler.scale(10) / 10;
    scaleFactor = math.min(scaleFactor, 1.5);

    return baseSize * scaleFactor;
  }

  // ===========================================================================
  //  Padding & Radius (Consistent Spacing)
  // ===========================================================================

  // Padding
  double paddingExtraSmall() => scale(0.015);
  double paddingSmall() => scale(0.025);
  double paddingMedium() => scale(0.04);
  double paddingLarge() => scale(0.06);
  double paddingXLarge() => scale(0.08);

  // Specific Padding
  double fieldPadding() => scale(0.04);

  // Radius
  double radiusSmall() => scale(0.02);
  double radiusMedium() => scale(0.035);
  double radiusLarge() => scale(0.05);
  double radiusRound() => 1000.0;

  // ===========================================================================
  //  Icon Sizes
  // ===========================================================================

  double iconSmall() => scale(0.045);
  double iconMedium() => scale(0.06);
  double iconLarge() => scale(0.08);
  double iconXXLarge() => scale(0.12);

  // ===========================================================================
  //  Spacing Widgets (SizedBox)
  // ===========================================================================

  SizedBox vSpace(double fraction) => SizedBox(height: size.height * fraction);
  SizedBox hSpace(double fraction) => SizedBox(width: size.width * fraction);

  SizedBox gap(double value) => SizedBox(height: value, width: value);

  // ===========================================================================
  //  Adaptive Text Style
  // ===========================================================================

  TextStyle textStyle({
    double? fontSize,
    FontWeight fontWeight = FontWeight.normal,
    Color? color,
    double? height,
    TextOverflow? overflow,
  }) {
    return TextStyle(
      fontSize: fontSize ?? fontMedium(),
      fontWeight: fontWeight,
      color: color,
      height: height,
      overflow: overflow,
    );
  }

  // ===========================================================================
  // Grid Helper
  // ===========================================================================

  int get responsiveCrossAxisCount {
    if (isDesktop) return 4;
    if (isTablet) return 3;
    return 2;
  }
}
