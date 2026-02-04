import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/core/network/api_endpoints.dart';

class AuthRemoteSource {
  final ApiClient _apiClient;
  AuthRemoteSource(this._apiClient);

  Future<dynamic> SignUp(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.register,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // otp
  Future<dynamic> OTP(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.verifyOtp,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // login
  Future<dynamic> Login(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.login,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // forgot password email section
  Future<dynamic> ForgotPasswordEmail(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.forgotPasswordEmail,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // forgot password otp
  Future<dynamic> ForgotPasswordOTP(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.forgotPasswordOtp,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // forgot password otp
  Future<dynamic> ResetNewPassword(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.resetNewPassword,
        body: body,
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
