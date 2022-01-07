// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.results,
    required this.cenaSpolu,
  });

  List<CartResult> results;
  int cenaSpolu;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        results: List<CartResult>.from(
            json["results"].map((x) => CartResult.fromJson(x))),
        cenaSpolu: json["cena_spolu"],
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "cena_spolu": cenaSpolu,
      };
}

class CartResult {
  CartResult({
    required this.id,
    required this.idCart,
    required this.idProduct,
    required this.image,
    required this.name,
    required this.price,
    required this.available,
    required this.count,
    required this.description,
    required this.type,
  });

  String id;
  String idCart;
  String idProduct;
  String image;
  String name;
  String price;
  String available;
  String count;
  String description;
  String type;

  factory CartResult.fromJson(Map<String, dynamic> json) => CartResult(
        id: json["id"],
        idCart: json["id_cart"],
        idProduct: json["id_product"],
        image: json["image"],
        name: json["name"],
        price: json["price"],
        available: json["available"],
        count: json["count"],
        description: json["description"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_cart": idCart,
        "id_product": idProduct,
        "image": image,
        "name": name,
        "price": price,
        "available": available,
        "count": count,
        "description": description,
        "type": type,
      };
}
