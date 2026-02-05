import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/auth_repository_impl/auth_repository_impl.dart';
import 'package:picks_empire/data/sources/local_shared_preference/shared_preferene.dart';
import 'package:picks_empire/data/sources/remote/auth_remote_source.dart';
import 'package:picks_empire/presentation/screens/auth/login/view_model/login_state.dart';

import '../../../../../data/model/auth_model/login_model.dart';

class LoginViewModel extends StateNotifier<LoginStateModel> {
  final AuthRepositoryImpl _authRepositoryImpl;
  LoginViewModel(this._authRepositoryImpl) : super(LoginStateModel());

  Future<void> login(LoginModel model, VoidCallback onSuccess) async {
    // Start loading - validation is now handled by the UI
    state = state.copyWith(isLoading: true);
    log("====================================================");
    log("====================================================");
    log("====================================================");
    log("====================================================");

    log('🚀 [LOGIN ATTEMPT]', name: 'AUTH_VM');
    log('Payload: ${model.toJson()}', name: 'AUTH_VM');

    try {
      //await Future.delayed(const Duration(seconds: 2));

      final response = await _authRepositoryImpl.LoginService(model);

      if (response != null && response['token'] != null) {
        String token = response['token'];
        await SharedPreferenceData.setToken(token);
        await ApiClient.headerSet(token);
        log('✅ [LOGIN SUCCESS]', name: 'AUTH_VM');
        log('Token Saved: $token', name: 'AUTH_VM');
      }
      state = state.copyWith(isLoading: false);
      onSuccess();
    } catch (e) {
      state = state.copyWith(isLoading: false);

      if (e is DioException) {
        log('❌ [LOGIN ERROR]');
      }
    }
    log("====================================================");
    log("====================================================");
    log("====================================================");
    log("====================================================");
  }
}

final loginProvider =
    StateNotifierProvider.autoDispose<LoginViewModel, LoginStateModel>((ref) {
      final apiClient = ApiClient();
      final remoteSource = AuthRemoteSource(apiClient);
      final repository = AuthRepositoryImpl(remoteSource);
      return LoginViewModel(repository);
    });
