import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';
import 'package:picks_empire/presentation/screens/widgets/custom_back_btn.dart';

import '../../../../../core/constrants/app_colors.dart';
import '../../../../../core/resources/style_manager.dart';
import '../../../../../core/routes/route_name.dart';
import '../view_model/category_view_model.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: customBackButton(context),
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Which categories do you like?",
                  style: getSemiBoldStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  "You can select up to 5",
                  style: getRegularStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(height: 30),

                // categoy
                Row(
                  children: [
                    categoryChip("Sports", ref),
                    const SizedBox(width: 10),
                    categoryChip("Stocks", ref),
                    const SizedBox(width: 10),
                    categoryChip("Crypto", ref),
                    const SizedBox(width: 10),
                    categoryChip("Casino", ref),
                  ],
                ),
                SizedBox(height: 30),
                // continue btn
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: getElevatedButtonStyle(color: AppColors.BtnColor),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteName.logInScreen,
                        (predicate) => false,
                      );
                    },
                    child: Text(
                      "Continue",
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

  // category widget
  Widget categoryChip(String title, WidgetRef ref) {
    final selectedCategories = ref.watch(categoryProvider);
    final isSelected = selectedCategories.contains(title);

    return GestureDetector(
      onTap: () {
        final notifier = ref.read(categoryProvider.notifier);
        if (isSelected) {
          notifier.state = notifier.state
              .where((item) => item != title)
              .toList();
        } else {
          if (selectedCategories.length < 5) {
            notifier.state = [...notifier.state, title];
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.BtnColor
              : Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white70,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
