import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/presentation/screens/auth/forgot_password/view_model/forgot_password_view_model.dart';

import '../../../../../core/constrants/app_colors.dart';
import '../../../../../core/resources/style_manager.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/custom_back_btn.dart';
import '../../../widgets/custom_text_input_field.dart';

class ForgotPasswordEmailScreen extends ConsumerStatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  ConsumerState<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState
    extends ConsumerState<ForgotPasswordEmailScreen> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(forgotPasswordProvider);
    final read = ref.read(forgotPasswordProvider.notifier);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: customBackButton(context),
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Enter your email, and we’ll guide you to reset your password.",
                    style: getRegularStyle(color: Colors.white70, fontSize: 14),
                  ),

                  SizedBox(height: 30),
                  // full name title
                  Text(
                    "Email",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // Full Name input field
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 20),

                  // continue button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: () {
                        read.forgotPassword(emailController.text.trim(), () {
                          Navigator.pushNamed(
                            context,
                            RouteName.forgotPassword_OTPScreen,
                            arguments: emailController.text.trim(),
                          );
                        });
                      },
                      child: Text(
                        "Continue",
                        style: getSemiBoldStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
