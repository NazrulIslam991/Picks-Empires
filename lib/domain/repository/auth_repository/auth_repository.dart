import 'package:picks_empire/data/model/auth_model/forgot_password_model.dart';
import 'package:picks_empire/data/model/auth_model/login_model.dart';
import 'package:picks_empire/data/model/auth_model/otp_model.dart';
import 'package:picks_empire/data/model/signup_model.dart';

import '../../../data/model/auth_model/forgot_password_otp_model.dart';
import '../../../data/model/auth_model/reset_new_password_model.dart';

abstract class AuthRepository {
  // signUp method
  Future<dynamic> signUp(SignupModel data);
  // otp
  Future<dynamic> OtpService(OtpModel otp);
  // Login
  Future<dynamic> LoginService(LoginModel model);
  // forgot password
  Future<dynamic> forgotPassword(ForgotPasswordModel model);
  // forgot password otp verificaton
  Future<dynamic> forgotPasswordOTPVerificaiton(ForgotPasswordOTPModel model);
  // reset new password
  Future<dynamic> resetNewPassword(ResetPasswordModel model);
  // forgot resemd otp
  Future<dynamic> resendOtp(String email);
}
