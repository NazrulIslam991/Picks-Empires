import 'package:flutter/material.dart';

import '../../../../core/constrants/app_colors.dart';
import '../../../../core/resources/style_manager.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/custom_back_btn.dart';
import '../../widgets/custom_text_input_field.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subController = TextEditingController();
  final msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leading: customBackButton(context),
        title: Text(
          "Help and Support",
          style: getSemiBoldStyle(color: Colors.white, fontSize: 17),
        ),
        centerTitle: true,
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
                    "Have a question or feedback? We'd love to hear from you.",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  // name title
                  Text(
                    "Name",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // name input field
                  CustomTextField(
                    controller: nameController,
                    hintText: "Enter your name",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 10),
                  // email title
                  Text(
                    "Email",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // email input field
                  CustomTextField(
                    controller: emailController,
                    hintText: "your.email@example.com",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 10),
                  // subject title
                  Text(
                    "Subject",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // subject input field
                  CustomTextField(
                    controller: subController,
                    hintText: "What's this about?",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),

                  SizedBox(height: 10),
                  // Message title
                  Text(
                    "Message",
                    style: getRegularStyle(color: Colors.grey, fontSize: 12),
                  ),
                  SizedBox(height: 7),
                  // message input field
                  CustomTextField(
                    controller: msgController,
                    hintText: "Write your question or feedback here...",
                    //errorText: watch.nameError,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    maxLines: 6,
                  ),

                  SizedBox(height: 30),
                  // send messege btn
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: () {},
                      child: Text(
                        "Send Message",
                        style: getSemiBoldStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text(
                      "We typically respond within 24 hours.",
                      style: getRegularStyle(color: Colors.grey, fontSize: 16),
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
