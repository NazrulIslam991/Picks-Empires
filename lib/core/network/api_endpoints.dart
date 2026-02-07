class ApiEndpoints {
  //static const String baseUrl = "http://192.168.7.102:4010/api";
  //static const String baseUrl = "https://fakestoreapi.com";
  static const String baseUrl = "https://dummyjson.com";
  static const String products = "products";
  static const String products_2 = "products";
  static const String register = 'auth/register';
  static const String verifyOtp = 'auth/verify-email';
  static const String login = 'auth/login';
  static const String forgotPasswordEmail = 'auth/forgot-password';
  static const String forgotPasswordOtp = 'auth/verify-forgot-password-otp';
  static const String resetNewPassword = 'auth/reset-password';
  static const String forgotPasswordResendOtp =
      'auth/resend-forgot-password-otp';

  // static const String login = 'api/auth/login';
  // static const String switchRole = 'api/auth/switch-role';
  // static const String verifyMail = 'api/auth/verify-email';
  // static const String resendOtp = 'api/auth/resend-verification-email';
  // static const String loadUser = 'api/auth/me';
  // static const String updateProfile = 'api/auth/update-profile';
  // static const String forgetPassword = 'api/auth/forgot-password';
  // static const String createAndagetJob = 'api/jobs';
}
