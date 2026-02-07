import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/product_repo_impl_2.dart';
import 'package:picks_empire/data/sources/remote/product_remote_source_2.dart';

final productRemoteProvider = Provider(
  (ref) => ProductRemoteSource2(ApiClient()),
);

final productRepoImplProvider = Provider(
  (ref) => ProductRepoImpl2(ref.watch(productRemoteProvider)),
);

final productFutureProvider2 = FutureProvider((ref) async {
  return ref.watch(productRepoImplProvider).getAllProducts();
});

// filter by title

final productSearchProvider = StateProvider<String>((ref) => '');

// delete product by id
final deleteProductProvider = Provider((ref) {
  final repo = ref.watch(productRepoImplProvider);
  return repo;
});
