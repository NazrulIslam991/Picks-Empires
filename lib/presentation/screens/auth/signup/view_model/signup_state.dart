class SignupStateModel {
  final bool isLoading;
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  SignupStateModel({
    this.isLoading = false,
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  SignupStateModel copyWith({
    bool? isLoading,
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
  }) {
    return SignupStateModel(
      isLoading: isLoading ?? this.isLoading,
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    );
  }
}
