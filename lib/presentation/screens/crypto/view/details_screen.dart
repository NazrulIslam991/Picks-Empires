import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:picks_empire/core/routes/route_name.dart';
import 'package:picks_empire/data/model/product/product_model_2.dart';
import 'package:picks_empire/presentation/screens/crypto/view_model/product_view_model_2.dart';

import '../../widgets/custom_dialog.dart';

class DetailsScreen extends ConsumerWidget {
  final ProductModel_2 model_2;
  const DetailsScreen({super.key, required this.model_2});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Product Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [buildMenuAction(context, ref)],
      ),
      body: Column(
        children: [
          SafeArea(
            child: Container(
              height: 250,
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: Image.network(model_2.thumbnail!, fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                // Professional Dark Gradient
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF1F1C2C), Color(0xFF445069)],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildChip(
                          model_2.brand ?? "Brand",
                          Colors.white10,
                          Colors.white70,
                        ),
                        const SizedBox(width: 10),
                        _buildChip(
                          model_2.category ?? "Category",
                          Colors.white10,
                          Colors.amberAccent,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            model_2.title!,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "\$${model_2.price}",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < (model_2.rating ?? 0).round()
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 14.h,
                            );
                          }),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${model_2.rating}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoItem(
                          Icons.verified_user_outlined,
                          "Warranty",
                          model_2.warranty ?? "N/A",
                        ),
                        _buildInfoItem(
                          Icons.local_shipping_outlined,
                          "Shipping",
                          "Express",
                        ),
                        _buildInfoItem(
                          Icons.assignment_return_outlined,
                          "Return",
                          model_2.return_policy ?? "N/A",
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      model_2.description!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 25),
                    if (model_2.shipping_information != null)
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 20.h,
                              color: Colors.amberAccent,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                model_2.shipping_information!,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build a popup menu for update and delete actions
  PopupMenuButton<String> buildMenuAction(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      // Handle menu selection
      onSelected: (String value) {
        if (value == "Update") {
          Navigator.pushNamed(
            context,
            RouteName.productUpdateScreen,
            arguments: model_2,
          );
        }
        // delete product with confirmation dialog
        else if (value == "Delete") {
          buildDeleteProduct(context, ref);
        }
      },
      // item builder for options
      itemBuilder: (context) => [
        PopupMenuItem<String>(
          value: "Update",
          child: Text("Update", style: TextStyle(color: Colors.white)),
        ),
        PopupMenuItem<String>(
          value: "Delete",
          child: Text("Delete", style: TextStyle(color: Colors.white)),
        ),
      ],
      // Customize the icon
      icon: const Icon(Icons.more_vert, color: Colors.white),
      color: const Color(0xFF1F1C2C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: const BorderSide(color: Colors.white10),
      ),
    );
  }

  // delete product with confirmation dialog
  void buildDeleteProduct(BuildContext context, WidgetRef ref) {
    return showCustomDialog(
      context: context,
      title: 'Delete Product?',
      subtitle:
          'Are you sure you want to delete this product? This action cannot be undone.',
      onConfirm: () async {
        try {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
          // 1. Perform the API call
          await ref.read(deleteProductProvider).deleteProductById(model_2.id!);

          // Ensure the widget is still in the tree before navigating
          if (!context.mounted) return;

          // 2. Close the Dialog first
          Navigator.of(context).pop();

          // 3. Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Product deleted successfully (Simulated)"),
              backgroundColor: Colors.green,
            ),
          );

          // 4. Invalidate the provider so the list refreshes
          ref.invalidate(productFutureProvider2);

          // 5. Close the Details Screen and return to the list
          Navigator.of(context).pop();
        } catch (e) {
          if (!context.mounted) return;

          // Close the dialog on error so the user isn't stuck
          Navigator.of(context).pop();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Failed to delete: $e"),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }

  Widget _buildChip(String label, Color bgColor, Color textColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label.toUpperCase(),
        style: TextStyle(
          color: textColor,
          fontSize: 10.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.amberAccent, size: 22.h),
        SizedBox(height: 8.h),
        Text(
          title,
          style: TextStyle(fontSize: 12.sp, color: Colors.white38),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
