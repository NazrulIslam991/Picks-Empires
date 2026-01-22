import 'package:flutter/material.dart';

import 'font_manager.dart';

// Private generic text style helper
TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  // 🔥 FIX: Added fontWeight here, otherwise bold/medium won't work
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

// -----------------------------------------------------------------------------
// TEXT STYLES
// -----------------------------------------------------------------------------

// Light text style
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.light300,
    color,
  );
}

// Regular text style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.regural400,
    color,
  );
}

// Medium text style
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.medium500,
    color,
  );
}

// SemiBold text style
TextStyle getSemiBoldStyle({
  double fontSize = FontSize.s14,
  required Color color,
}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.semiBold600,
    color,
  );
}

// Bold text style
TextStyle getBoldStyle({double fontSize = FontSize.s24, required Color color}) {
  return _getTextStyle(
    fontSize,
    FontConstants.fontFamily,
    FontWeightManager.bold700,
    color,
  );
}

// -----------------------------------------------------------------------------
// BUTTON STYLES (NEW SECTION)
// -----------------------------------------------------------------------------

/// Primary Elevated Button Style
ButtonStyle getElevatedButtonStyle({
  required Color color,
  Color foregroundColor = Colors.white,
  double radius = 12.0,
  double elevation = 0,
  double? textFontSize,
}) {
  return ElevatedButton.styleFrom(
    backgroundColor: color,
    foregroundColor: foregroundColor, // Text/Icon color
    elevation: elevation,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    textStyle: getRegularStyle(
      color: foregroundColor,
      fontSize: textFontSize ?? FontSize.s14, // Default size if not provided
    ),
  );
}

/// Border/Outlined Button Style (Optional, if needed later)
ButtonStyle getOutlinedButtonStyle({
  required Color color,
  double radius = 8.0,
  double borderWidth = 1.0,
}) {
  return OutlinedButton.styleFrom(
    foregroundColor: color,
    side: const BorderSide(color: Colors.black45, width: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    textStyle: getRegularStyle(color: color),
  );
}

/// Text Button Style
ButtonStyle getTextButtonStyle({required Color color, double? fontSize}) {
  return TextButton.styleFrom(
    foregroundColor: color,
    textStyle: getRegularStyle(
      color: color,
      fontSize: fontSize ?? FontSize.s12,
    ),
  );
}
