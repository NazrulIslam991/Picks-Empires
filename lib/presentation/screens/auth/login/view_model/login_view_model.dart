import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/presentation/screens/auth/login/view_model/login_state.dart';

import '../../../../../core/constrants/validator.dart';

class LoginViewModel extends StateNotifier<LoginStateModel> {
  LoginViewModel() : super(LoginStateModel());

  Future<void> login(
    String email,
    String password,
    VoidCallback onSuccess,
  ) async {
    // Validation using separate class
    final emailErr = ValidationManager.validateEmail(email);
    final passErr = ValidationManager.validatePassword(password);

    if (emailErr != null || passErr != null) {
      state = state.copyWith(emailError: emailErr, passwordError: passErr);
      return;
    }

    // Clear errors and start loading
    state = state.copyWith(
      isLoading: true,
      emailError: null,
      passwordError: null,
    );

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
