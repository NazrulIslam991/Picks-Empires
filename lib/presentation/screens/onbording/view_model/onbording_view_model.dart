import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/constrants/app_images.dart';

import '../../../../domain/entities/onbording_model/onbording_model.dart';

// for list
final onboardingListProvider = Provider<List<OnbordingModel>>((ref) {
  return [
    OnbordingModel(
      img: AppImages.onbording_bg_1,
      title: "Elite Sports Picks. AI-Driven. Pro-Verified.",
      description:
          "AI-powered predictions refined by expert analysts for maximum accuracy.",
    ),
    OnbordingModel(
      img: AppImages.onbording_bg_2,
      title: "Premium Crypto Setups. High-Accuracy, High-Reward.",
      description:
          "AI-filtered plays with expert confirmation and clear risk levels.",
    ),
    OnbordingModel(
      img: AppImages.onbording_bg_3,
      title: "High Accuracy Stock Plays. Only Premium Setups.",
      description:
          "Ultra-selective trades filtered by AI, confirmed by professionals.",
    ),
    OnbordingModel(
      img: AppImages.onbording_bg_4,
      title: "Beat the Machines. Smartest Slot Entry Points.",
      description:
          "Smart data identifies slot machines with the highest bonus potential right now.",
    ),
  ];
});

// for index
final onBordingIndexProvider = StateProvider<int>((ref) => 0);
// pageController
final pageControllerProvider = Provider.autoDispose((ref) => PageController());
