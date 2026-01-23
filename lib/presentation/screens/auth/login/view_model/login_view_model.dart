import 'dart:ui';

import 'package:flutter_riverpod/legacy.dart';

import '../../../../../data/model/auth_model/login_model.dart';

class LoginViewModel extends StateNotifier<LoginModel> {
  LoginViewModel() : super(LoginModel());

  void togglePassword() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void toggleRememblerMe(bool? value) {
    state = state.copyWith(rememberMe: value ?? false);
  }

  // 1. Validation Logic
  Map<String, String?> _getValidationErrors(String email, String password) {
    String? emailErr;
    String? passErr;

    if (email.isEmpty) {
      emailErr = "Email is required";
    } else if (!email.contains('@')) {
      emailErr = "Invalid email format";
    }

    if (password.isEmpty) {
      passErr = "Password is required";
    } else if (password.length < 6) {
      passErr = "Password must be at least 6 characters";
    }

    return {'email': emailErr, 'password': passErr};
  }

  Future<void> login(
    String email,
    String password,
    VoidCallback onSuccess,
  ) async {
    final errors = _getValidationErrors(email, password);
    final bool isValid = errors['email'] == null && errors['password'] == null;

    if (!isValid) {
      state = state.copyWith(
        isLoading: false,
        emailError: errors['email'],
        passwordError: errors['password'],
      );
      return;
    }

    state = state.copyWith(
      isLoading: true,
      emailError: null,
      passwordError: null,
    );

    try {
      // 4. API Call
      await Future.delayed(const Duration(seconds: 2));

      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginModel>((ref) {
      return LoginViewModel();
    });
