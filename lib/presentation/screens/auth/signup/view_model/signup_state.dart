class SignupStateModel {
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmError;
  final bool isLoading;

  SignupStateModel({
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmError,
    this.isLoading = false,
  });

  SignupStateModel copyWith({
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confrimPasswordError,
    bool? isLoading,
  }) {
    return SignupStateModel(
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmError: confrimPasswordError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
