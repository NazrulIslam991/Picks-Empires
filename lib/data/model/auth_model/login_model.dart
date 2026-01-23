class LoginModel {
  final bool isPasswordVisible;
  final bool rememberMe;
  final String? emailError;
  final String? passwordError;
  final bool isLoading;
  LoginModel({
    this.isPasswordVisible = false,
    this.rememberMe = false,
    this.emailError,
    this.passwordError,
    this.isLoading = false,
  });

  LoginModel copyWith({
    bool? isPasswordVisible,
    bool? rememberMe,
    String? emailError,
    String? passwordError,
    bool? isLoading,
  }) {
    return LoginModel(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      rememberMe: rememberMe ?? this.rememberMe,
      emailError: emailError,
      passwordError: passwordError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
