// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

import 'dart:convert';

Product ProductFromJson(String str) => Product.fromJson(json.decode(str));

String ProductToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.results,
  });

  List<Result> results;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    required this.image,
    required this.name,
    required this.price,
    required this.available,
    required this.count,
    required this.description,
    required this.type,
  });

  String id;
  String image;
  String name;
  String price;
  String available;
  String count;
  String description;
  String type;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
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
        "image": image,
        "name": name,
        "price": price,
        "available": available,
        "count": count,
        "description": description,
        "type": type,
      };
}
