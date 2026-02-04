import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/constrants/validator.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/presentation/screens/auth/signup/view_model/signup_state.dart';

class SignUpViewModel extends StateNotifier<SignupStateModel> {
  final AuthRepositoryImpl _repository;
  SignUpViewModel(this._repository) : super(SignupStateModel());

  Future<void> SignUp(
    String name,
    String email,
    String password,
    String conPassword,
    VoidCallback onSuccess,
  ) async {
    final nameErr = ValidationManager.validateName(name);
    final emalErr = ValidationManager.validateEmail(email);
    final passErr = ValidationManager.validatePassword(password);
    final conPassErr = ValidationManager.validateConfirmPassword(
      conPassword,
      password,
    );
    state = state.copyWith(isLoading: true, nameError: null, emailError: null);

    if (nameErr != null ||
        emalErr != null ||
        passErr != null ||
        conPassErr != null) {
      state = state.copyWith(
        nameError: nameErr,
        emailError: emalErr,
        passwordError: passErr,
        confirmPasswordError: conPassErr,
        isLoading: false,
      );
      return;
    }
    state = state.copyWith(
      nameError: null,
      emailError: null,
      passwordError: null,
      confirmPasswordError: null,
      isLoading: true,
    );
    try {
      print("$name $email $password $conPassword");
      final user = await _repository.signUp(name, email, password);
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      // Example of setting a specific error based on response
      state = state.copyWith(isLoading: false);
      print("SIGNUP FAILED ERROR: $e");
    }
  }
}

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpViewModel, SignupStateModel>((ref) {
      final apiClient = ApiClient();
      final remouteSource = AuthRemoteSource(apiClient);
      final repository = AuthRepositoryImpl(remouteSource);
      return SignUpViewModel(repository);
    });
