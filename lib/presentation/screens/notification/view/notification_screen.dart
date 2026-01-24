import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';

import '../../../../core/resources/style_manager.dart';
import '../../widgets/custom_back_btn.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
          "Notification",
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // recent msg section
                  Text("Recent", style: getBoldStyle(color: Colors.white)),
                  SizedBox(height: 15),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return msgCardWidget();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: 2,
                  ),
                  SizedBox(height: 20),

                  // earlier msg section
                  Text("Earlier", style: getBoldStyle(color: Colors.white)),
                  SizedBox(height: 15),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return msgCardWidget();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // msg card widget
  Widget msgCardWidget() {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white10, width: 0.5),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Image.asset(AppImages.vip_logo, color: AppColors.BtnColor),
            ),
            title: Text(
              "Sports Pick",
              style: getSemiBoldStyle(color: Colors.white, fontSize: 16),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                "We predict Man City to win based on home advantage, xG, and injuries.",
                style: getRegularStyle(color: Colors.white, fontSize: 13),
              ),
            ),
          ),
        ),

        // Time Text Positioned at Top Right
        Positioned(
          top: 10,
          right: 20,
          child: Text(
            "2 min ago",
            style: TextStyle(
              color: Colors.white.withOpacity(0.4),
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
