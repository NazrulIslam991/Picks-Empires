class ProductModel_2 {
  int? id;
  String? title;
  String? description;
  double? price;
  double? rating;
  String? brand;
  String? thumbnail;
  String? category;
  String? warranty;
  String? shipping_information;
  String? return_policy;
  double? minimum_order_quantity;

  ProductModel_2({
    this.id,
    this.title,
    this.description,
    this.price,
    this.rating,
    this.brand,
    this.thumbnail,
    this.category,
    this.warranty,
    this.shipping_information,
    this.return_policy,
    this.minimum_order_quantity,
  });

  ProductModel_2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    price = json['price'] != null ? (json['price'] as num).toDouble() : 0.0;
    rating = json['rating'] != null ? (json['rating'] as num).toDouble() : 0.0;
    brand = json['brand'];
    thumbnail = json['thumbnail'];
    category = json['category'];
    warranty = json['warrantyInformation'];
    shipping_information = json['shippingInformation'];
    return_policy = json['returnPolicy'];
    minimum_order_quantity = json['minimumOrderQuantity'] != null
        ? (json['minimumOrderQuantity'] as num).toDouble()
        : 0.0;
  }
}
