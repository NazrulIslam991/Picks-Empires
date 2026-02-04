import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/core/network/api_endpoints.dart';

class AuthRemoteSource {
  final ApiClient _apiClient;
  AuthRemoteSource(this._apiClient);

  Future<dynamic> SignUp(Map<String, dynamic> body) async {
    try {
      final response = await _apiClient.postRequest(
        endpoints: ApiEndpoints.register,
        body: body,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
