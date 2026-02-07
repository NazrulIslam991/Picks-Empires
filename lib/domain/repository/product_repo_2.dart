import 'package:picks_empire/data/model/product/product_model_2.dart';

abstract class ProductRepo2 {
  Future<List<ProductModel_2>> getAllProducts();
  // delete product by id
  Future<void> deleteProductById(int id);
}
