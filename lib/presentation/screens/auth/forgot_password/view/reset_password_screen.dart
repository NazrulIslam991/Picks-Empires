import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/presentation/screens/auth/forgot_password/view_model/forgot_password_view_model.dart';

import '../../../../../core/constrants/app_colors.dart';
import '../../../../../core/resources/style_manager.dart';
import '../../../../../core/routes/route_name.dart';
import '../../../widgets/background_widget.dart';
import '../../../widgets/custom_back_btn.dart';
import '../../../widgets/custom_text_input_field.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                    "Create New Password",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Enter your new password",
                    style: getRegularStyle(color: Colors.white70, fontSize: 14),
                  ),

                  SizedBox(height: 30),

                  Text(
                    "New Password",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),

                  // Enter your password input field
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    keyboardType: TextInputType.name,
                    // errorText: watch.passwordError,
                    //obscureText: !watch.isPasswordVisible,
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      onPressed: () {
                        //read.togglePasswordVisibility();
                      },
                      icon: Icon(Icons.visibility_off, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 10),
                  //Confirm password title
                  Text(
                    "Confirm password",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  //Re-enter your password input field
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: "Re-enter your password",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.done,
                    //obscureText: !watch.isCPasswordVisible,
                    //errorText: watch.confirmError,
                    suffixIcon: IconButton(
                      onPressed: () {
                        //read.togglePasswordVisibility();
                      },
                      icon: Icon(Icons.visibility_off, color: Colors.white),
                    ),
                  ),

                  SizedBox(height: 30),

                  // continue button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: () {
                        if (passwordController.text ==
                            confirmPasswordController.text) {
                          read.resetPassword(
                            widget.email,
                            passwordController.text.trim(),
                            () {
                              Navigator.pushNamed(
                                context,
                                RouteName.logInScreen,
                              );
                            },
                          );
                        }
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
