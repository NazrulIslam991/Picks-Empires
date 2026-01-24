class SignupModel {
  final String? nameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmError;
  final bool isLoading;

  SignupModel({
    this.nameError,
    this.emailError,
    this.passwordError,
    this.confirmError,
    this.isLoading = false,
  });

  SignupModel copyWith({
    String? nameError,
    String? emailError,
    String? passwordError,
    String? confrimPasswordError,
    bool? isLoading,
  }) {
    return SignupModel(
      nameError: nameError,
      emailError: emailError,
      passwordError: passwordError,
      confirmError: confrimPasswordError,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
