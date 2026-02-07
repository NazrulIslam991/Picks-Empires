import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:picks_empire/presentation/screens/strocks/view_model/product_view_model.dart';
import 'package:picks_empire/presentation/screens/widgets/background_widget.dart';

import '../../../../core/resources/style_manager.dart';

class StrocksScreen extends ConsumerWidget {
  const StrocksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productList = ref.watch(productFutureProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 60,
        title: Text(
          "Products",
          style: getBoldStyle(color: Colors.grey.shade200, fontSize: 18),
        ),
      ),
      body: BackgroundWidget(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              return await ref.refresh(productFutureProvider.future);
            },
            child: productList.when(
              data: (products) {
                if (products.isEmpty) {
                  return const Center(
                    child: Text(
                      "No products found!",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final item = products[index];
                    return Padding(
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 10,
                        right: 10,
                        bottom: 3,
                      ),
                      child: Card(
                        color: Colors.white.withOpacity(0.4),
                        child: ListTile(
                          leading: Image.network(item.image!, width: 50),
                          title: Text(
                            item.title!,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text("\$${item.price}"),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
              error: (err, stack) => Center(child: Text("Error: $err")),
            ),
          ),
        ),
      ),
    );
  }
}
