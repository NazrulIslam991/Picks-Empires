import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/domain/entities/auth_model/user_model.dart';
import 'package:picks_empire/presentation/screens/auth/signup/view_model/signup_state.dart';

import '../../../../../core/constrants/validator.dart';

class SignUpViewModel extends StateNotifier<SignupStateModel> {
  SignUpViewModel() : super(SignupStateModel());

  // Sign Up call
  Future<void> SignUp(
    String name,
    String email,
    String password,
    String confirm_password,
    Function(UserModel user) onSuccess,
  ) async {
    // Validation using separate class
    final emailErr = ValidationManager.validateEmail(email);
    final passErr = ValidationManager.validatePassword(password);
    final nameErr = ValidationManager.validatePassword(password);
    final confirmPassErr = ValidationManager.validateConfirmPassword(
      password,
      confirm_password,
    );

    if (nameErr != null ||
        passErr != null ||
        passErr != null ||
        confirmPassErr != null) {
      state = state.copyWith(
        nameError: nameErr,
        emailError: emailErr,
        passwordError: passErr,
        confrimPasswordError: confirmPassErr,
      );
      return;
    }

    // Clear errors and start loading
    state = state.copyWith(
      isLoading: true,
      nameError: null,
      emailError: null,
      passwordError: null,
      confrimPasswordError: null,
    );
    try {
      await Future.delayed(const Duration(seconds: 2));
      state = state.copyWith(isLoading: false);
      final userData = UserModel(name: name, email: email, password: password);
      onSuccess(userData);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignupStateModel>((ref) {
      return SignUpViewModel();
    });
