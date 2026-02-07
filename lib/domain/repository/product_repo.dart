import 'package:picks_empire/data/model/product/product_model.dart';

abstract class ProductRepo {
  Future<List<ProductModel>> getProducts();
}
