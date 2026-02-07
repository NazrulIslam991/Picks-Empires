import 'package:picks_empire/data/model/product/product_model_2.dart';
import 'package:picks_empire/data/sources/remote/product_remote_source_2.dart';
import 'package:picks_empire/domain/repository/product_repo_2.dart';

class ProductRepoImpl2 implements ProductRepo2 {
  final ProductRemoteSource2 _productRemoteSource_2;
  ProductRepoImpl2(this._productRemoteSource_2);

  @override
  Future<List<ProductModel_2>> getAllProducts() async {
    try {
      final response = await _productRemoteSource_2.getAllProducts();

      if (response != null && response['products'] != null) {
        final List data = response['products'];
        return data.map((e) => ProductModel_2.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      print("Error in Repo: $e");
      rethrow;
    }
  }

  // delete product by id
  @override
  Future<void> deleteProductById(int id) async {
    try {
      await _productRemoteSource_2.deleteProductById(id);
    } catch (e) {
      print("Error in Repo Delete: $e");
      rethrow;
    }
  }
}
