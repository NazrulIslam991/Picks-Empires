import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/domain/repository/auth_repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  AuthRepositoryImpl(this._remoteSource);

  @override
  Future<dynamic> signUp(String name, String email, String password) async {
    final response = await _remoteSource.SignUp({
      "name": name,
      "email": email,
      "password": password,
    });
    // Mapping Data Model to Domain Entity
    return response;
  }

  // otp verified
  @override
  Future<dynamic> OtpService(String email, String otp) async {
    final respose = await _remoteSource.OTP({"email": email, "otp": otp});
    return respose;
  }

  // login
  @override
  Future<dynamic> LoginService(String email, String pass) async {
    final response = await _remoteSource.Login({
      "email": email,
      "password": pass,
    });
    return response;
  }

  // forgot password email input
  @override
  Future<dynamic> forgotPassword(String email) async {
    final response = await _remoteSource.ForgotPasswordEmail({"email": email});
    return response;
  }

  // forgot password Otp

  @override
  Future<dynamic> forgotPasswordOTPVerificaiton(
    String email,
    String otp,
  ) async {
    final response = await _remoteSource.ForgotPasswordOTP({
      "email": email,
      "otp": otp,
    });
    return response;
  }

  @override
  Future<dynamic> resetNewPassword(String email, String pass) async {
    final response = await _remoteSource.ResetNewPassword({
      "email": email,
      "password": pass,
    });
    return response;
  }

  @override
  Future<dynamic> resendOtp(String email) async {
    final response = await _remoteSource.Login({"email": email});
    return response;
  }
}
