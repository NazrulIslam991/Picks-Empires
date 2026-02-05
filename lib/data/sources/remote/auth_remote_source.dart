import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/core/network/api_endpoints.dart';
import 'package:picks_empire/data/model/auth_model/forgot_password_model.dart';
import 'package:picks_empire/data/model/auth_model/login_model.dart';
import 'package:picks_empire/data/model/auth_model/otp_model.dart';
import 'package:picks_empire/data/model/signup_model.dart';

import '../../model/auth_model/forgot_password_otp_model.dart';
import '../../model/auth_model/reset_new_password_model.dart';

class AuthRemoteSource {
  final ApiClient _apiClient;
  AuthRemoteSource(this._apiClient);

  Future<dynamic> SignUp(SignupModel data) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.register,
        body: data.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // otp
  // otp verification
  Future<dynamic> OTP(OtpModel otp) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.verifyOtp,
        body: otp.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // login
  Future<dynamic> Login(LoginModel model) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.login,
        body: model.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // forgot password email section
  Future<dynamic> ForgotPasswordEmail(ForgotPasswordModel model) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.forgotPasswordEmail,
        body: model.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // forgot password otp
  Future<dynamic> ForgotPasswordOTP(ForgotPasswordOTPModel model) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.forgotPasswordOtp,
        body: model.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // forgot password otp
  Future<dynamic> ResetNewPassword(ResetPasswordModel model) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.resetNewPassword,
        body: model.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // forgot password resend otp
  Future<dynamic> forgotPassowrdResendOtp(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.forgotPasswordResendOtp,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
