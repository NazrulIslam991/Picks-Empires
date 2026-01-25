class LoginStateModel {
  final String? emailError;
  final String? passwordError;
  final bool isLoading;

  LoginStateModel({
    this.emailError,
    this.passwordError,
    this.isLoading = false,
  });

  LoginStateModel copyWith({
    String? emailError,
    String? passwordError,
    bool? isLoading,
  }) {
    return LoginStateModel(
      emailError: emailError,
      passwordError: passwordError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
