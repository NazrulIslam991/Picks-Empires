import 'package:picks_empire/data/model/auth_model/forgot_password_model.dart';
import 'package:picks_empire/data/model/auth_model/login_model.dart';
import 'package:picks_empire/data/model/auth_model/otp_model.dart';
import 'package:picks_empire/data/model/auth_model/signup_model.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/domain/repository/auth_repository/auth_repository.dart';

import '../../model/auth_model/forgot_password_otp_model.dart';
import '../../model/auth_model/reset_new_password_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource _remoteSource;
  AuthRepositoryImpl(this._remoteSource);

  @override
  Future<dynamic> signUp(SignupModel data) async {
    final response = await _remoteSource.SignUp(data);
    return response;
  }

  // otp verified
  @override
  Future<dynamic> OtpService(OtpModel otp) async {
    final respose = await _remoteSource.OTP(otp);
    return respose;
  }

  // login
  @override
  Future<dynamic> LoginService(LoginModel model) async {
    final response = await _remoteSource.Login(model);
    return response;
  }

  // forgot password email input
  @override
  Future<dynamic> forgotPassword(ForgotPasswordModel model) async {
    final response = await _remoteSource.ForgotPasswordEmail(model);
    return response;
  }

  // forgot password Otp

  @override
  Future<dynamic> forgotPasswordOTPVerificaiton(
    ForgotPasswordOTPModel model,
  ) async {
    final response = await _remoteSource.ForgotPasswordOTP(model);
    return response;
  }

  @override
  Future<dynamic> resetNewPassword(ResetPasswordModel model) async {
    final response = await _remoteSource.ResetNewPassword(model);
    return response;
  }

  @override
  Future<dynamic> resendOtp(String email) async {
    final response = await _remoteSource.forgotPassowrdResendOtp({
      "email": email,
    });
    return response;
  }
}
