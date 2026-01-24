import 'package:flutter/material.dart';
import 'package:picks_empire/core/resources/style_manager.dart';
import 'package:picks_empire/core/routes/route_name.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_back_btn.dart';

import '../../../../core/constrants/app_colors.dart';
import '../../widgets/background_widget.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

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
          "Subscription",
          style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Let's join",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "VIP MEMBERS",
                    style: getBoldStyle(color: Colors.white, fontSize: 28),
                  ),
                  SizedBox(height: 30),

                  Text(
                    "Claim 50% off your first sub with ",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      style: getBoldStyle(color: Colors.white, fontSize: 16),
                      children: const [
                        TextSpan(text: "code: "),
                        TextSpan(text: "WELCOMEE50"),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

                  subscriptionCardWidget(),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: getElevatedButtonStyle(color: AppColors.BtnColor),
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.subsConfirmationScreen,
                        );
                      },
                      child: Text(
                        "Subscribe Now",
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

  // subscription card
  Widget subscriptionCardWidget() {
    return Container(
      padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            const Color(0xFF1B5E20).withOpacity(0.8),
            const Color(0xFF0D1117),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "\$99",
                      style: getBoldStyle(color: Colors.white, fontSize: 36),
                    ),
                    TextSpan(
                      text: " /month",
                      style: getRegularStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              // "All Access" Badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "All Access",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "For individuals new to budgeting and looking to take control of their finances with basic AI insights.",
            style: getRegularStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 20),
          const Divider(color: Colors.white24),
          const SizedBox(height: 20),

          // Feature List
          _buildFeatureItem("AI-based spending analysis"),
          _buildFeatureItem("Personalized savings suggestions"),
          _buildFeatureItem("Weekly expense reports"),
          _buildFeatureItem("Basic budget setup and tracking"),
          _buildFeatureItem("Basic budget setup and tracking"),
          _buildFeatureItem("Basic budget setup and tracking"),
        ],
      ),
    );
  }

  // subscription features item widget
  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.white70,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: getRegularStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
