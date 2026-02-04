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
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final watch = ref.watch(signUpProvider);
    final passwordVisibility = ref.watch(passwordVisibilityProvider);
    final confirmPasswordVisibility = ref.watch(
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
                  const SizedBox(height: 5),
                  Text(
                    "Please fill your detail information",
                    style: getRegularStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 30),

                  _buildTitle("Full Name"),
                  CustomTextField(
                    controller: fullNameController,
                    hintText: "Enter your full name",
                    keyboardType: TextInputType.name,
                    errorText: watch.nameError,
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 10),
                  _buildTitle("Email"),
                  CustomTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    errorText: watch.emailError,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),

                  const SizedBox(height: 10),
                  _buildTitle("Enter password"),
                  CustomTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: passwordVisibility,
                    errorText: watch.passwordError,
                    maxLines: 1,
                    textInputAction: TextInputAction.next,

                    suffixIcon: IconButton(
                      onPressed: () => ref
                          .read(passwordVisibilityProvider.notifier)
                          .toggle(),
                      icon: Icon(
                        passwordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 10),
                  _buildTitle("Confirm password"),
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: "Re-enter your password",
                    textInputAction: TextInputAction.done,
                    obscureText: confirmPasswordVisibility,
                    errorText: watch.confirmPasswordError,
                    maxLines: 1,

                    suffixIcon: IconButton(
                      onPressed: () => ref
                          .read(confirmPasswordVisibilityProvider.notifier)
                          .toggle(),
                      icon: Icon(
                        confirmPasswordVisibility
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.white70,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),

                  const SizedBox(height: 30),

                  // signUp button
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: watch.isLoading ? null : _handleSignup,
                      child: watch.isLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : Text(
                              "Continue",
                              style: getSemiBoldStyle(color: Colors.black),
                            ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildLoginLink(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // signup process
  void _handleSignup() {
    final signupNotifier = ref.read(signUpProvider.notifier);

    // 3. Execute the Signup logic
    signupNotifier.SignUp(
      fullNameController.text.trim(),
      emailController.text.trim(),
      passwordController.text.trim(),
      confirmPasswordController.text.trim(),
      () {
        // 4. Handle Navigation on Success
        if (mounted) {
          Navigator.pushNamed(context, RouteName.otpScreen);
        }
      },
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Text(
        title,
        style: getRegularStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Have an account? ",
          style: getRegularStyle(color: Colors.grey, fontSize: 13),
          children: [
            TextSpan(
              text: "Login",
              style: getSemiBoldStyle(color: AppColors.BtnColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () =>
                    Navigator.pushNamed(context, RouteName.logInScreen),
            ),
          ],
        ),
      ),
    );
  }
}
