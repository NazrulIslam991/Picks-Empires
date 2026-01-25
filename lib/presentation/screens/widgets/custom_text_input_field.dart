import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final int? maxLines;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.errorText,
    this.obscureText = false,
    this.suffixIcon,
    required this.keyboardType,
    required this.textInputAction,
    this.prefixIcon,
    this.prefixText,
    this.prefixStyle,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    print("Field: $hintText, Error: $errorText");
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      maxLines: maxLines,
      style: getRegularStyle(color: Colors.white, fontSize: 14),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.secondaryColor,
        hintText: hintText,
        errorText: errorText,

        hintStyle: getRegularStyle(color: ColorManager.hintText),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        prefixStyle: prefixStyle,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black45, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorManager.errorColor,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: ColorManager.errorColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
