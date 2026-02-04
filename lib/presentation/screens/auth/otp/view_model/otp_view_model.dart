import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/presentation/screens/auth/otp/view_model/otp_state.dart';

class OtpViewModel extends StateNotifier<OtpState> {
  final AuthRepositoryImpl _repositoryImpl;
  OtpViewModel(this._repositoryImpl) : super(OtpState());

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
      await _repositoryImpl.OtpService(email, otp);
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

final otpProvider = StateNotifierProvider<OtpViewModel, OtpState>((ref) {
  final apiClient = ApiClient();
  final remoteSource = AuthRemoteSource(apiClient);
  final repository = AuthRepositoryImpl(remoteSource);
  return OtpViewModel(repository);
});
