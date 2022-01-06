// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
  Cart({
    required this.results,
  });

  List<Result> results;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.id,
    required this.idCart,
    required this.idProduct,
  });

  String id;
  String idCart;
  String idProduct;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        idCart: json["id_cart"],
        idProduct: json["id_product"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_cart": idCart,
        "id_product": idProduct,
      };
}
