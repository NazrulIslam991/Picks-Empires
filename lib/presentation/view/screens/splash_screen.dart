import 'dart:async';

import 'package:flutter/material.dart';
import 'package:picks_empire/core/constrants/app_images.dart';

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
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.onBordingScreen,
        (predicate) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        //   statusBarIconBrightness: Brightness.light,
        //   statusBarBrightness: Brightness.dark,
        // ),
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
}
