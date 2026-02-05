import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/core/routes/route_name.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_dialog.dart';

import '../../../../core/resources/style_manager.dart';
import '../../auth/login/services.dart';
import '../../widgets/background_widget.dart';
import '../../widgets/custom_back_btn.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
          "Settings",
          style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

                  // --- Profile Section ---
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1.5),
                            decoration: const BoxDecoration(
                              color: Color(0xFF00E676),
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(AppImages.profile),
                            ),
                          ),
                          // VIP Badge
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF00E676),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                "VIP",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Arisha Ireen",
                            style: getSemiBoldStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "@Arisha1889",
                            style: getRegularStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // --- Settings Options ---
                  _buildSectionTitle("Personal Info"),
                  _buildSettingTile(Icons.person_outline, "Profile", () {
                    Navigator.pushNamed(context, RouteName.profileScreen);
                  }),

                  _buildSectionTitle("Security"),
                  _buildSettingTile(Icons.lock_outline, "Change Password", () {
                    Navigator.pushNamed(
                      context,
                      RouteName.forgotPassword_EmailScreen,
                    );
                  }),
                  _buildSettingTile(Icons.lock_reset, "Forgot Password", () {
                    Navigator.pushNamed(
                      context,
                      RouteName.forgotPassword_EmailScreen,
                    );
                  }),
                  _buildSettingTile(
                    Icons.verified_user_outlined,
                    "Security",
                    () {},
                  ),

                  _buildSectionTitle("General"),
                  _buildSettingTile(Icons.language, "Language", () {}),

                  _buildSectionTitle("About"),
                  _buildSettingTile(
                    Icons.shield_outlined,
                    "Legal and Policies",
                    () {
                      Navigator.pushNamed(
                        context,
                        RouteName.legalAndPolicyScreen,
                      );
                    },
                  ),
                  _buildSettingTile(Icons.help_outline, "Help & Support", () {
                    Navigator.pushNamed(
                      context,
                      RouteName.helpAndSupportScreen,
                    );
                  }),

                  const SizedBox(height: 10),

                  // Logout Button
                  ListTile(
                    onTap: () {
                      showCustomDialog(
                        context: context,
                        title: "Logout",
                        subtitle: "Are you sure you want to log out?",
                        onConfirm: () async {
                          final AuthService authService = AuthService();

                          await authService.signOut();

                          if (context.mounted) {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RouteName.logInScreen,
                              (predicate) => false,
                            );
                          }
                        },
                      );
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.logout, color: Colors.redAccent),
                    title: Text(
                      "Logout",
                      style: getMediumStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Section Header Widget
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 4),
      child: Text(
        title,
        style: getRegularStyle(color: Colors.white60, fontSize: 14),
      ),
    );
  }

  // Custom ListTile Widget for Settings
  Widget _buildSettingTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.white, size: 18),
      title: Text(
        title,
        style: getMediumStyle(color: Colors.white, fontSize: 14),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white54,
        size: 14,
      ),
    );
  }
}
