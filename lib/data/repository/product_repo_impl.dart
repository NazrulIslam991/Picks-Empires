import 'package:picks_empire/data/model/product/product_model.dart';
import 'package:picks_empire/data/sources/remote/product_remote_source.dart';
import 'package:picks_empire/domain/repository/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteSource _remoteSource;
  ProductRepoImpl(this._remoteSource);
  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _remoteSource.getProducts();
    return (response as List).map((e) => ProductModel.fromJson(e)).toList();
  }
}
