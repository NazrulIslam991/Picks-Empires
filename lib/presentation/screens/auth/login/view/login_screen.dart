import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/core/resources/style_manager.dart';
import 'package:picks_empire/core/routes/route_name.dart';
import 'package:picks_empire/data/model/auth_model/login_model.dart';
import 'package:picks_empire/presentation/screens/auth/login/services.dart';
import 'package:picks_empire/presentation/screens/auth/login/view_model/login_view_model.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_text_input_field.dart';

import '../../../widgets/background_widget.dart';
import '../view_model/toggle_password_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // 1. Define Form Key
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final isPasswordVisible = ref.watch(passwordVisibilityProvider);
    final isRememberMe = ref.watch(rememberMeProvider);
    final AuthService _authService = AuthService();

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 12,
              right: 12,
              bottom: 12,
            ),
            child: SingleChildScrollView(
              // 2. Wrap content in a Form
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: getSemiBoldStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Please fill Up and Login to your account",
                      style: getRegularStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 50),

                    _buildFieldTitle("Email Address"),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Enter your email address",
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,

                      // 3. Add Validator
                    ),
                    const SizedBox(height: 10),

                    _buildFieldTitle("Password"),
                    CustomTextField(
                      controller: passwordController,
                      hintText: "Enter your password",
                      obscureText: !isPasswordVisible,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,

                      // 3. Add Validator
                      suffixIcon: IconButton(
                        onPressed: () => ref
                            .read(passwordVisibilityProvider.notifier)
                            .toggle(),
                        icon: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white70,
                        ),
                      ),
                    ),

                    // Remember me and forgot password
                    Row(
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: Checkbox(
                            value: isRememberMe,
                            onChanged: (val) => ref
                                .read(rememberMeProvider.notifier)
                                .set(val ?? false),
                            shape: const CircleBorder(),
                            side: const BorderSide(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                            checkColor: Colors.black87,
                            activeColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Remember Me",
                          style: getRegularStyle(color: Colors.grey),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            RouteName.forgotPassword_EmailScreen,
                          ),
                          child: Text(
                            "Forgot Password",
                            style: getSemiBoldStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: loginState.isLoading
                            ? null
                            : () {
                                // 4. Validate Form before calling ViewModel
                                if (_formKey.currentState!.validate()) {
                                  ref.read(loginProvider.notifier).login(
                                    LoginModel(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                    () {
                                      Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        RouteName.navBarScreen,
                                        (predicate) => false,
                                      );
                                    },
                                  );
                                }
                              },
                        style: getElevatedButtonStyle(
                          color: AppColors.BtnColor,
                        ),
                        child: loginState.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black,
                              )
                            : Text(
                                "Login",
                                style: getSemiBoldStyle(color: Colors.black),
                              ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: OrDividerWidget(),
                    ),
                    const SizedBox(height: 25),

                    _buildSocialBtn(
                      imagePath: AppImages.google,
                      title: "Continue with Google",
                      onTap: () async {
                        UserCredential? userCredential = await _authService
                            .signInWithGoogle();

                        if (userCredential != null) {
                          debugPrint("Login Successful and Token Saved!");

                          if (!context.mounted) return;
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.navBarScreen,
                            (route) => false,
                          );
                        } else {
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Google Sign-In failed or was cancelled.",
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    _buildSocialBtn(
                      imagePath: AppImages.apple,
                      title: "Continue with Apple",
                      onTap: () {},
                    ),

                    const SizedBox(height: 30),
                    _buildSignUpFooter(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper methods to keep UI code clean
  Widget _buildFieldTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: getRegularStyle(color: Colors.white54, fontSize: 14),
      ),
    );
  }

  Widget _buildSocialBtn({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 20, width: 20),
            const SizedBox(width: 10),
            Text(title, style: getSemiBoldStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpFooter(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          text: "Don’t have an account? ",
          style: getRegularStyle(color: Colors.grey, fontSize: 13),
          children: [
            TextSpan(
              text: "Create",
              style: getSemiBoldStyle(color: AppColors.BtnColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () =>
                    Navigator.pushNamed(context, RouteName.signUpScreen),
            ),
          ],
        ),
      ),
    );
  }
}

// Separate widget for the Divider
class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or Sign In With",
            style: getRegularStyle(color: Colors.grey.shade400),
          ),
        ),
        const Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }
}
