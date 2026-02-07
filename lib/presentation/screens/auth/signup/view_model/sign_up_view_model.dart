import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/constrants/validator.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/model/auth_model/signup_model.dart';
import 'package:picks_empire/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/presentation/screens/auth/signup/view_model/signup_state.dart';

class SignUpViewModel extends StateNotifier<SignupStateModel> {
  final AuthRepositoryImpl _repository;
  SignUpViewModel(this._repository) : super(SignupStateModel());

  Future<void> SignUp(SignupModel data, VoidCallback onSuccess) async {
    final nameErr = ValidationManager.validateName(data.name);
    final emalErr = ValidationManager.validateEmail(data.email);
    final passErr = ValidationManager.validatePassword(data.password);
    final conPassErr = ValidationManager.validateConfirmPassword(
      data.confirmPass,
      data.password,
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
      //print("$name $email $password $conPassword");
      // Debug Print:
      debugPrint("======== OTP Verification Started ========");
      debugPrint("Name: ${data.name}");
      debugPrint("Email: ${data.email}");
      debugPrint("Password: ${data.password}");
      debugPrint("Confirm Password: ${data.confirmPass}");
      // repo call
      final user = await _repository.signUp(data);
      debugPrint("Status: SUCCESS ");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      debugPrint("Status: FAILED - OTP Error");
      debugPrint("Error Detail: $e");
      debugPrint("==========================================");
      state = state.copyWith(isLoading: false);
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
