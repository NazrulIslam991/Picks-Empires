import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:picks_empire/data/sources/local_shared_preference/shared_preferene.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/presentation/screens/auth/login/view_model/login_state.dart';

class LoginViewModel extends StateNotifier<LoginStateModel> {
  final AuthRepositoryImpl _authRepositoryImpl;
  LoginViewModel(this._authRepositoryImpl) : super(LoginStateModel());

  Future<void> login(
    String email,
    String password,
    VoidCallback onSuccess,
  ) async {
    // Start loading - validation is now handled by the UI
    state = state.copyWith(isLoading: true);

    try {
      //await Future.delayed(const Duration(seconds: 2));
      final response = await _authRepositoryImpl.LoginService(email, password);

      if (response != null && response['token'] != null) {
        String token = response['token'];
        await SharedPreferenceData.setToken(token);
        await ApiClient.headerSet(token);
      }
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginStateModel>((ref) {
      final apiClient = ApiClient();
      final remoteSource = AuthRemoteSource(apiClient);
      final repository = AuthRepositoryImpl(remoteSource);
      return LoginViewModel(repository);
    });
