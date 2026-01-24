import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_images.dart';

import '../../../../core/constrants/app_colors.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/routes/route_name.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/custom_back_btn.dart';

class SubscriptionSuccessfullScreen extends StatelessWidget {
  const SubscriptionSuccessfullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        leading: customBackButton(context),
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.sub_success_img),
                SizedBox(height: 20),
                Text(
                  "Your subscription is success",
                  style: getBoldStyle(color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  "Thank you for your subscription to Kickster, enjoy various premium features of the world of football in your pocket",
                  style: getRegularStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                // back to home screen btn
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: getElevatedButtonStyle(color: AppColors.BtnColor),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.navBarScreen,
                        (predicate) => false,
                      );
                    },
                    child: Text(
                      "Back to Home",
                      style: getSemiBoldStyle(color: Colors.black),
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
