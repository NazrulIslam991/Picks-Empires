import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';
import 'package:picks_empire/core/resources/style_manager.dart';
import 'package:picks_empire/presentation/screens/auth/login/view_model/toggle_password_view_model.dart';
import 'package:picks_empire/presentation/screens/auth/signup/view_model/sign_up_view_model.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_text_input_field.dart';

import '../../../../../core/routes/route_name.dart';
import '../../../widgets/custom_back_btn.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(signUpProvider);
    final passwordVisivility = ref.watch(passwordVisibilityProvider);
    final confirmPasswordVisivility = ref.watch(
      confirmPasswordVisibilityProvider,
    );
    final read = ref.read(signUpProvider.notifier);
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
                    "Create New Account 🔥",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Please fill your detail information",
                    style: getRegularStyle(color: Colors.white70, fontSize: 14),
                  ),

                  SizedBox(height: 30),
                  // full name title
                  Text(
                    "Full Name",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // Full Name input field
                  CustomTextField(
                    controller: fullNameController,
                    hintText: "Enter your full name",
                    errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10),
                  // Enter your email title
                  Text(
                    "Email",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // Enter your email input field
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    errorText: watch.emailError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10),
                  // Enter password title
                  Text(
                    "Enter password",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // Enter your password input field
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    keyboardType: TextInputType.name,
                    errorText: watch.passwordError,
                    obscureText: passwordVisivility,
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      onPressed: () => ref
                          .read(passwordVisibilityProvider.notifier)
                          .toggle(),
                      icon: Icon(
                        passwordVisivility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
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
                    obscureText: confirmPasswordVisivility,
                    errorText: watch.confirmError,
                    suffixIcon: IconButton(
                      onPressed: () => ref
                          .read(passwordVisibilityProvider.notifier)
                          .toggle(),
                      icon: Icon(
                        confirmPasswordVisivility
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // continue button
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: watch.isLoading
                          ? null
                          : () {
                              read.SignUp(
                                fullNameController.text,
                                emailController.text,
                                passwordController.text,
                                confirmPasswordController.text,
                                (userData) {
                                  Navigator.pushNamed(
                                    context,
                                    RouteName.otpScreen,
                                    arguments: userData,
                                  );
                                },
                              );
                            },
                      child: watch.isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Continue",
                              style: getSemiBoldStyle(color: Colors.black),
                            ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Have an account? Login
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Have an account? ",
                        style: getRegularStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                            text: "Login",
                            style: getSemiBoldStyle(color: AppColors.BtnColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  RouteName.logInScreen,
                                );
                              },
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
      ),
    );
  }
}
