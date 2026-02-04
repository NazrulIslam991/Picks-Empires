import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/presentation/screens/auth/forgot_password/view_model/forgot_password_state_model.dart';

class ForgotPasswordViewModel extends StateNotifier<ForgotPasswordStateModel> {
  final AuthRepositoryImpl _authRepositoryImpl;
  ForgotPasswordViewModel(this._authRepositoryImpl)
    : super(ForgotPasswordStateModel());

  // forgot password email
  Future<void> forgotPassword(String email, VoidCallback onSuccess) async {
    state = state.copyWith(isLoading: true);

    try {
      final resposnse = await _authRepositoryImpl.forgotPassword(email);
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      state = state.copyWith(isLoading: false);
      print("SIGNUP FAILED ERROR: $e");
    }
  }

  // forgot password otp section
  Future<void> VerifyOtp(
    String email,
    String otp,
    VoidCallback onSuccess,
  ) async {
    state = state.copyWith(isLoading: true);
    // Debug Print:
    debugPrint("======== OTP Verification Started ========");
    debugPrint("Email: $email");
    debugPrint("Entered OTP: $otp");
    try {
      await _authRepositoryImpl.forgotPasswordOTPVerificaiton(email, otp);
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
    String email,
    String password,
    VoidCallback onSuccess,
  ) async {
    state = state.copyWith(isLoading: true);
    // Debug Print:
    debugPrint("======== OTP Verification Started ========");
    debugPrint("Email: $email");
    debugPrint("Entered OTP: $password");
    try {
      await _authRepositoryImpl.resetNewPassword(email, password);
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
