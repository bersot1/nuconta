import '../../data/models/models.dart';

class OfferModel {
  OfferModel({
    required this.id,
    required this.price,
    required this.product,
  });

  String id;
  int price;
  ProductModel product;

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json["id"],
        price: json["price"],
        product: ProductModel.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "product": product.toJson(),
      };
}
