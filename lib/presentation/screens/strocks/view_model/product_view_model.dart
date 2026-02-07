import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/core/network/api_clients.dart';
import 'package:picks_empire/data/repository/product_repo_impl.dart';
import 'package:picks_empire/data/sources/remote/product_remote_source.dart';

final productRemoteProvider = Provider(
  (ref) => ProductRemoteSource(ApiClient()),
);

final productReportProvider = Provider((ref) {
  return ProductRepoImpl(ref.watch(productRemoteProvider));
});

final productFutureProvider = FutureProvider((ref) async {
  return ref.watch(productReportProvider).getProducts();
});
