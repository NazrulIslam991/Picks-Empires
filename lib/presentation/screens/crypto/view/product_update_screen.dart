import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:picks_empire/data/model/product/product_model_2.dart';

class ProductUpdateScreen extends StatefulWidget {
  final ProductModel_2 model_2;
  const ProductUpdateScreen({super.key, required this.model_2});

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  late TextEditingController titleController;
  late TextEditingController descController;
  late TextEditingController priceController;
  late TextEditingController brandController;
  late TextEditingController categoryController;
  late TextEditingController ratingController;
  late TextEditingController warrantyController;
  late TextEditingController shippingInfoController;
  late TextEditingController returnPolicyController;
  late TextEditingController minimumOrderController;

  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.model_2.title);
    descController = TextEditingController(text: widget.model_2.description);
    priceController = TextEditingController(
      text: widget.model_2.price.toString(),
    );
    brandController = TextEditingController(text: widget.model_2.brand);
    warrantyController = TextEditingController(text: widget.model_2.warranty);
    categoryController = TextEditingController(text: widget.model_2.category);
    returnPolicyController = TextEditingController(
      text: widget.model_2.return_policy,
    );
    shippingInfoController = TextEditingController(
      text: widget.model_2.shipping_information,
    );
    ratingController = TextEditingController(
      text: widget.model_2.rating!.toString(),
    );
    minimumOrderController = TextEditingController(
      text: widget.model_2.minimum_order_quantity!.toString(),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    priceController.dispose();
    brandController.dispose();
    categoryController.dispose();
    ratingController.dispose();
    warrantyController.dispose();
    shippingInfoController.dispose();
    returnPolicyController.dispose();
    minimumOrderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      "beauty",
      "fragrances",
      "furniture",
      "groceries",
      "home-decoration",
      "kitchen-accessories",
      "laptops",
    ];
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Edit Product",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        child: Column(
          children: [
            // Image Container
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 160.h,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 25.h),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: _selectedImage != null
                          ? Image.file(_selectedImage!, fit: BoxFit.cover)
                          : Image.network(
                              widget.model_2.thumbnail ?? "",
                              fit: BoxFit.contain,
                            ),
                    ),
                  ),

                  // The Edit Icon Layer
                  Positioned(
                    bottom: 35.h,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        _pickImag();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          size: 16.h,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // All Input Fields using labels/hints inside
            _buildTextField("Product Title", titleController),
            _buildTextField("Brand Name", brandController),
            // Category Field with Popup Menu
            Padding(
              padding: EdgeInsets.only(bottom: 18.h),
              child: buildCategoryInputField(categories),
            ),
            _buildTextField("Price", priceController, isNumber: true),
            _buildTextField("Rating", ratingController, isNumber: true),
            _buildTextField("Warranty Information", warrantyController),
            _buildTextField("Shipping Information", shippingInfoController),
            _buildTextField("Return Policy", returnPolicyController),
            _buildTextField(
              "Min Order Quantity",
              minimumOrderController,
              isNumber: true,
            ),
            _buildTextField("Description", descController, maxLines: 4),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 20,
          top: 10,
        ),
        child: SizedBox(
          width: double.infinity,
          height: 45.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              // Logic to call Update API
            },
            child: const Text(
              "SAVE CHANGES",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField buildCategoryInputField(List<String> categories) {
    return TextField(
      controller: categoryController,
      readOnly: true,
      style: const TextStyle(color: Colors.white, fontSize: 15),
      decoration: InputDecoration(
        labelText: "Category",
        labelStyle: const TextStyle(color: Colors.amberAccent, fontSize: 14),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.amberAccent, width: 1.5),
        ),
        // Suffix Arrow Button
        suffixIcon: PopupMenuButton<String>(
          offset: const Offset(0, 40),
          icon: const Icon(Icons.arrow_drop_down, color: Colors.amberAccent),
          onSelected: (String value) {
            setState(() {
              categoryController.text = value;
            });
          },
          color: const Color(0xFF1F1C2C),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.white10),
          ),
          itemBuilder: (BuildContext context) {
            return categories.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice, style: TextStyle(color: Colors.white)),
              );
            }).toList();
          },
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    int maxLines = 1,
    bool isNumber = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        style: const TextStyle(color: Colors.white, fontSize: 15),
        decoration: InputDecoration(
          labelText: label, // This acts as the small floating title
          labelStyle: const TextStyle(color: Colors.amberAccent, fontSize: 14),
          hintText: "Enter $label",
          hintStyle: const TextStyle(color: Colors.white24),
          filled: true,
          fillColor: Colors.white.withOpacity(0.05),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.amberAccent, width: 1.5),
          ),
        ),
      ),
    );
  }

  // image picker
  Future<void> _pickImag() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }
}
