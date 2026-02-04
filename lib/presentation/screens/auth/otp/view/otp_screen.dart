import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';
import 'package:picks_empire/core/routes/route_name.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_back_btn.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/resources/style_manager.dart';
import '../view_model/otp_view_model.dart';

class OtpScreen extends ConsumerStatefulWidget {
  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final optState = ref.watch(otpProvider);
    final read = ref.read(otpProvider.notifier);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: customBackButton(context),
        backgroundColor: Colors.transparent,
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter OTP Code",
                  style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  "We have just sent you 4 digit code via your email },'",
                  style: getRegularStyle(color: Colors.white70, fontSize: 14),
                ),

                SizedBox(height: 30),

                // pin
                Center(
                  child: Pinput(
                    controller: pinController,
                    separatorBuilder: (index) => const SizedBox(width: 16),
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: AppColors.BtnColor,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // continue btn
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: getElevatedButtonStyle(color: AppColors.BtnColor),
                    onPressed: () {
                      read.VerifyOtp(
                        widget.email,
                        pinController.text.trim(),
                        () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.categoryScreen,
                            (predicate) => false,
                          );
                        },
                      );
                    },
                    child: Text(
                      "Continue",
                      style: getSemiBoldStyle(color: Colors.black),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                //Didn’t receive code? Resend Code
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Didn’t receive code? ",
                      style: getRegularStyle(color: Colors.grey, fontSize: 13),
                      children: [
                        TextSpan(
                          text: "Resend Code",
                          style: getSemiBoldStyle(color: AppColors.BtnColor),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
