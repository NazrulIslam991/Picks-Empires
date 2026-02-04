abstract class AuthRepository {
  // signUp method
  Future<dynamic> signUp(String name, String email, String password);
  // otp
  Future<dynamic> OtpService(String email, String otp);
  // Login
  Future<dynamic> LoginService(String email, String pass);
  // forgot password
  Future<dynamic> forgotPassword(String email);
  // forgot password otp verificaton
  Future<dynamic> forgotPasswordOTPVerificaiton(String email, String otp);
  // reset new password
  Future<dynamic> resetNewPassword(String email, String pass);
  // forgot resemd otp
  Future<dynamic> resendOtp(String email);
}
