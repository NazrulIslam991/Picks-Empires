import 'dart:developer';

import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/core/network/api_endpoints.dart';

class ProductRemoteSource2 {
  final ApiClient _apiClient;
  ProductRemoteSource2(this._apiClient);

  // get product info
  Future<dynamic> getAllProducts() async {
    try {
      final response = await _apiClient.getRequest(
        endpoints: ApiEndpoints.products_2,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // delete product by id
  Future<dynamic> deleteProductById(int id) async {
    try {
      final response = await ApiClient.deleteRequest(
        endpoints: "${ApiEndpoints.products_2}/$id",
      );
      if (response != null && response['isDeleted'] == true) {
        log("Product $id marked as deleted in simulated backend.");
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
