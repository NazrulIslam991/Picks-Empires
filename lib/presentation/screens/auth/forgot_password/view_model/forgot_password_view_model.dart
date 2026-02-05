import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/presentation/screens/auth/forgot_password/view_model/forgot_password_state_model.dart';

import '../../../../../data/model/auth_model/forgot_password_model.dart';
import '../../../../../data/model/auth_model/forgot_password_otp_model.dart';
import '../../../../../data/model/auth_model/reset_new_password_model.dart';

class ForgotPasswordViewModel extends StateNotifier<ForgotPasswordStateModel> {
  final AuthRepositoryImpl _authRepositoryImpl;
  ForgotPasswordViewModel(this._authRepositoryImpl)
    : super(ForgotPasswordStateModel());

  // forgot password email
  Future<void> forgotPassword(
    ForgotPasswordModel model,
    VoidCallback onSuccess,
  ) async {
    state = state.copyWith(isLoading: true);

    try {
      final resposnse = await _authRepositoryImpl.forgotPassword(model);
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print("SIGNUP FAILED ERROR: $e");
    }
  }

  // forgot password otp section
  Future<void> VerifyOtp(
    ForgotPasswordOTPModel model,
    VoidCallback onSuccess,
  ) async {
    state = state.copyWith(isLoading: true);
    // Debug Print:
    debugPrint("======== OTP Verification Started ========");
    debugPrint("Email: ${model.email}");
    debugPrint("Entered OTP: ${model.otp}");
    try {
      await _authRepositoryImpl.forgotPasswordOTPVerificaiton(model);
      debugPrint("Status: SUCCESS - OTP Verified");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      debugPrint("Status: FAILED - OTP Error");
      debugPrint("Error Detail: $e");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
    }
  }

  // forgot password otp section
  Future<void> resetPassword(
    ResetPasswordModel model,
    VoidCallback onSuccess,
  ) async {
    state = state.copyWith(isLoading: true);
    // Debug Print:
    debugPrint("======== OTP Verification Started ========");
    debugPrint("Email: ${model.email}");
    debugPrint("Entered OTP: ${model.password}");
    try {
      await _authRepositoryImpl.resetNewPassword(model);
      debugPrint("Status: SUCCESS - OTP Verified");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      debugPrint("Status: FAILED - OTP Error");
      debugPrint("Error Detail: $e");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
    }
  }

  // forgot password resend otp
  Future<void> forgotPasswordResendOtp(
    String email,
    VoidCallback onSuccess,
  ) async {
    state = state.copyWith(isLoading: true);
    // Debug Print:
    debugPrint("======== OTP Verification Started ========");
    debugPrint("Email: $email");
    try {
      await _authRepositoryImpl.resendOtp(email);
      debugPrint("Status: SUCCESS - OTP Verified");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      debugPrint("Status: FAILED - OTP Error");
      debugPrint("Error Detail: $e");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
    }
  }
}

final forgotPasswordProvider =
    StateNotifierProvider<ForgotPasswordViewModel, ForgotPasswordStateModel>((
      ref,
    ) {
      final apiClient = ApiClient();
      final authRemoteSource = AuthRemoteSource(apiClient);
      final repository = AuthRepositoryImpl(authRemoteSource);
      return ForgotPasswordViewModel(repository);
    });
