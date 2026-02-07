import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/core/network/api_endpoints.dart';

class ProductRemoteSource {
  final ApiClient _apiClient;
  ProductRemoteSource(this._apiClient);

  Future<dynamic> getProducts() async {
    try {
      final response = await _apiClient.getRequest(
        endpoints: ApiEndpoints.products,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
