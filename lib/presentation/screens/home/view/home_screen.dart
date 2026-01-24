import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';
import 'package:picks_empire/core/resources/style_manager.dart';
import 'package:picks_empire/core/routes/route_name.dart';

import '../../../../core/constrants/app_images.dart';
import '../../widgets/background_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 60,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteName.settingScreen);
            },
            child: CircleAvatar(backgroundImage: AssetImage(AppImages.profile)),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Welcome",
              style: getRegularStyle(color: Colors.grey.shade200),
            ),
            Text(
              "Jone Doe",
              style: getSemiBoldStyle(
                color: Colors.grey.shade200,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.notificationScreen);
            },
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
          ),
        ],
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 10,
                right: 10,
                //bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(height: 10),

                  // categoray list view
                  ListView.separated(
                    itemCount: 5,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return categoryCardWidget();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 10);
                    },
                  ),
                  SizedBox(height: 10),
                  // Enable Notifications title
                  Text(
                    "Enable Notifications",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  // Enable Notifications card
                  enableNotificationWidget(),
                  SizedBox(height: 20),
                  // premium subscription
                  premiumSubscriptionCard(() {
                    Navigator.pushNamed(context, RouteName.subscriptionScreen);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // premium Subscription widget
  Widget premiumSubscriptionCard(VoidCallback tap) {
    return Card(
      color: AppColors.BtnColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.asset(AppImages.vip_logo, width: 50, height: 50),
              title: Text(
                "Free Trial Active",
                style: getSemiBoldStyle(color: Colors.black, fontSize: 20),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "2 days remaining • Join 10K+ winners",
                    style: getRegularStyle(color: Colors.black54, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "50% off your first sub with code: WELCOME50",
                    style: getSemiBoldStyle(color: Colors.black, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // subcription Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0D1117),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: tap,
                child: Text(
                  "Unlock Full Access – \$99/month",
                  style: getSemiBoldStyle(
                    color: const Color(0xFF00FF7F),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Enable notification Widget
  Widget enableNotificationWidget() {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Set Custom Alert Sound",
                    style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Set Custom Alert Sound",
                    style: getRegularStyle(color: Colors.white54, fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  // iphone alert sound setting
                  customAlertSoundRichText(
                    "iPhone: ",
                    "Settings -> Notification -> PicksEmpire -> Sounds ->",
                  ),
                  SizedBox(height: 5),
                  // Android alert sound setting
                  customAlertSoundRichText(
                    "Android: ",
                    "Settings -> Apps -> PicksEmpire -> Notification -> Sounds ->",
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.notifications_outlined,
              color: AppColors.BtnColor,
            ),
          ),
        ],
      ),
    );
  }

  // rich text widget
  Widget customAlertSoundRichText(String title1, String title2) {
    return RichText(
      text: TextSpan(
        text: title1,
        style: getRegularStyle(color: AppColors.BtnColor, fontSize: 14),
        children: [
          TextSpan(
            text: title2,
            style: getRegularStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }

  // category widget
  Card categoryCardWidget() {
    return Card(
      color: AppColors.secondaryColor,
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image section
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(AppImages.sports_img, fit: BoxFit.cover),
            ),
            // title section
            SizedBox(height: 10),
            RichText(
              text: TextSpan(
                text: "Sports Picks ",
                style: getSemiBoldStyle(color: Colors.white, fontSize: 20),

                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade400,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        "82% win rate",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // description
            Text(
              "Our top-tier category. AI models analyse every game, and analysts approve only the highest-edge picks. No noise — just elite selections with transparent win rates.",
              style: getRegularStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 10),
            // active picks
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "12 active picks",
                  style: getRegularStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
