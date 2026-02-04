import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:picks_empire/core/constrants/app_images.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/sources/local_shared_preference/shared_preferene.dart';

import '../../../core/routes/route_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.splash_bg),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SizedBox(
            height: 180,
            width: 180,
            child: Image(image: AssetImage(AppImages.logo)),
          ),
        ),
      ),
    );
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    final token = await SharedPreferenceData.getToken();
    if (token != null && token.isNotEmpty) {
      await ApiClient.headerSet(token);

      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.navBarScreen,
          (predicate) => false,
        );
      }
    } else {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouteName.onBordingScreen,
          (predicate) => false,
        );
      }
    }
  }
}
