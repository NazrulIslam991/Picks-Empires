import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/core/resources/style_manager.dart';
import 'package:picks_empire/presentation/screens/auth/login/view_model/login_view_model.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_text_input_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginProvider);
    final read = ref.read(loginProvider.notifier);
    return Scaffold(
      extendBodyBehindAppBar: true,
      //appBar: AppBar(backgroundColor: Colors.transparent),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.background),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back!",
                  style: getSemiBoldStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(height: 8),
                Text(
                  "Please fill Up and Login to your account",
                  style: getRegularStyle(color: Colors.grey, fontSize: 14),
                ),
                SizedBox(height: 50),

                Text(
                  "Email Address",
                  style: getRegularStyle(color: Colors.white54, fontSize: 14),
                ),
                SizedBox(height: 10),
                // email field
                CustomTextField(
                  controller: emailController,
                  hintText: "Enter your email address",
                  errorText: state.emailError,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 10),

                Text(
                  "Password",
                  style: getRegularStyle(color: Colors.white54, fontSize: 14),
                ),
                SizedBox(height: 10),
                // email field
                CustomTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  errorText: state.passwordError,
                  obscureText: !state.isPasswordVisible,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  suffixIcon: IconButton(
                    onPressed: () {
                      read.togglePassword();
                    },
                    icon: Icon(
                      state.isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                // Remember me and forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: state.rememberMe,
                      onChanged: (value) {
                        read.toggleRememblerMe(value);
                      },
                      shape: CircleBorder(),
                      side: const BorderSide(color: Colors.grey, width: 1.5),
                      checkColor: Colors.black87,
                      activeColor: Colors.white,
                    ),
                    SizedBox(width: 2),
                    Text(
                      "Remember Me",
                      style: getRegularStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    // Forgot Password
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot Password",
                        style: getSemiBoldStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                // login btn
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: state.isLoading
                        ? null
                        : () {
                            read.login(
                              emailController.text,
                              passwordController.text,
                              () {},
                            );
                          },
                    style: getElevatedButtonStyle(color: AppColors.BtnColor),
                    child: state.isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Login",
                            style: getSemiBoldStyle(color: Colors.black),
                          ),
                  ),
                ),
                SizedBox(height: 25),

                // ------- Or Sign In with----------
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: OrDivider(),
                ),
                SizedBox(height: 25),
                // signin with google button
                customBtn(
                  imagePath: AppImages.google,
                  title: "Continue with google",
                  onTap: () {},
                ),
                SizedBox(height: 15),
                // continue with apple button
                customBtn(
                  imagePath: AppImages.apple,
                  title: "Continue with Apple",
                  onTap: () {},
                ),
                SizedBox(height: 30),

                // dont have an account?? create account
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don’t have an account? ",
                      style: getRegularStyle(color: Colors.grey, fontSize: 13),
                      children: [
                        TextSpan(
                          text: "Create",
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

  Widget customBtn({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 20, width: 20),
              SizedBox(width: 10),
              Text(title, style: getSemiBoldStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  // ------- Or Divider widget----------
  Row OrDivider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: Colors.grey, height: 5)),
        SizedBox(width: 10),
        Text(
          "Or Sign In With",
          style: getRegularStyle(color: Colors.grey.shade400),
        ),
        SizedBox(width: 10),

        Expanded(child: Divider(color: Colors.grey, height: 5)),
      ],
    );
  }
}
