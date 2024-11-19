// To parse this JSON data, do
//
//     final unlimitedBacon = unlimitedBaconFromJson(jsonString);

import 'dart:convert';

List<UnlimitedBacon> unlimitedBaconFromJson(String str) => List<UnlimitedBacon>.from(json.decode(str).map((x) => UnlimitedBacon.fromJson(x)));

String unlimitedBaconToJson(List<UnlimitedBacon> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UnlimitedBacon {
    String model;
    String pk;
    Fields fields;

    UnlimitedBacon({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory UnlimitedBacon.fromJson(Map<String, dynamic> json) => UnlimitedBacon(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int price;
    String description;
    double stock;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.stock,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        stock: json["stock"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "stock": stock,
    };
}
