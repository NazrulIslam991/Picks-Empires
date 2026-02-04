import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/presentation/screens/auth/login/view_model/login_state.dart';

class LoginViewModel extends StateNotifier<LoginStateModel> {
  LoginViewModel() : super(LoginStateModel());

  Future<void> login(
    String email,
    String password,
    VoidCallback onSuccess,
  ) async {
    // Start loading - validation is now handled by the UI
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginStateModel>((ref) {
      return LoginViewModel();
    });
