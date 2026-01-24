// presentation/common_view_models/toggle_view_model.dart

import 'package:flutter_riverpod/legacy.dart';

class ToggleNotifier extends StateNotifier<bool> {
  ToggleNotifier(bool initialState) : super(initialState);

  void toggle() => state = !state;
  void set(bool value) => state = value;
}

final passwordVisibilityProvider =
    StateNotifierProvider.autoDispose<ToggleNotifier, bool>((ref) {
      return ToggleNotifier(false);
    });
final confirmPasswordVisibilityProvider =
    StateNotifierProvider.autoDispose<ToggleNotifier, bool>((ref) {
      return ToggleNotifier(false);
    });

final rememberMeProvider =
    StateNotifierProvider.autoDispose<ToggleNotifier, bool>((ref) {
      return ToggleNotifier(false);
    });
