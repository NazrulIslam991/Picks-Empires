import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/resources/style_manager.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String subtitle,
  required VoidCallback onConfirm,
  IconData? icon,
  String confirmBtnText = "Confirm",
  String cancelBtnText = "Cancel",
  Color confirmBtnColor = Colors.redAccent,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: const Color(0xFF0F172A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: confirmBtnColor, size: 40),
                  const SizedBox(height: 15),
                ],

                // Title
                Text(
                  title,
                  style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                ),
                const SizedBox(height: 10),

                // Subtitle
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: getRegularStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 25),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          cancelBtnText,
                          style: getRegularStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: confirmBtnColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: onConfirm,
                        child: Text(
                          confirmBtnText,
                          style: getSemiBoldStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
