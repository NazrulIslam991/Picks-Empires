import 'package:flutter/material.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';

import '../../../../core/constrants/app_colors.dart';
import '../../../../core/constrants/app_images.dart';
import '../../../../core/resources/style_manager.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 60,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sports Picks",
              style: getBoldStyle(color: Colors.grey.shade200, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              "12 active picks",
              style: getRegularStyle(color: Colors.grey.shade200, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, RouteName.notificationScreen);
            },
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Live Picks",
                    style: getBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 15),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return pickCardWidget();
                    },
                    separatorBuilder: (context, indax) {
                      return SizedBox(height: 10);
                    },
                    itemCount: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // pickCardWidget
  Widget pickCardWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                AppImages.vip_logo,
                color: AppColors.BtnColor,
                height: 18,
                width: 18,
              ),
              const SizedBox(width: 10),

              // Date and Time Text
              Text(
                "10/23/2025 4:46 AM",
                style: getRegularStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 12,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),
          // Description Text
          Text(
            "We predict Man City to win based on home advantage, xG, and injuries.",
            style: getRegularStyle(
              color: Colors.white.withOpacity(
                0.8,
              ), // Slightly bright for readability
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
