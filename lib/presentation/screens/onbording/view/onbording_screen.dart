import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/core/constrants/app_colors.dart';
import 'package:picks_empire/core/resources/style_manager.dart';
import 'package:picks_empire/core/routes/route_name.dart';
import 'package:picks_empire/presentation/screens/onbording/view_model/onbording_view_model.dart';

class OnbordingScreen extends ConsumerWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onBordingList = ref.watch(onboardingListProvider);
    final onBordingIndex = ref.watch(onBordingIndexProvider);
    final onBordingIndexRead = ref.read(onBordingIndexProvider.notifier);
    final pageController = ref.watch(pageControllerProvider);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Stack(
        children: [
          // bg image
          PageView.builder(
            itemCount: onBordingList.length,
            controller: pageController,
            onPageChanged: (index) {
              onBordingIndexRead.state = index;
            },
            itemBuilder: (context, index) {
              return Image.asset(
                onBordingList[index].img,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ), // page indicator
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // title
                Text(
                  onBordingList[onBordingIndex].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                // description
                Text(
                  onBordingList[onBordingIndex].description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onBordingList.length, (index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 6,
                      width: onBordingIndex == index ? 20 : 6,
                      decoration: BoxDecoration(
                        color: onBordingIndex == index
                            ? AppColors.BtnColor
                            : Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 30),
                // btn
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: getElevatedButtonStyle(
                      color: AppColors.BtnColor,
                      radius: 22,
                    ),
                    onPressed: () {
                      if (onBordingIndex < onBordingList.length - 1) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteName.logInScreen,
                          (predicate) => false,
                        );
                      }
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
