// To parse this JSON data, do
//
//     final produk = produkFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        this.id,
        this.productName,
        this.productDesc,
        this.price,
        this.productPic,
        this.tUserupdate,
        this.tIpaddress,
        this.createdAt,
        this.updatedAt,
        this.picture,
    });

    int id;
    String productName;
    String productDesc;
    String price;
    String productPic;
    TUserupdate tUserupdate;
    String tIpaddress;
    DateTime createdAt;
    DateTime updatedAt;
    String picture;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        productName: json["product_name"],
        productDesc: json["product_desc"],
        price: json["price"],
        productPic: json["product_pic"],
        tUserupdate: tUserupdateValues.map[json["t_userupdate"]],
        tIpaddress: json["t_ipaddress"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_name": productName,
        "product_desc": productDesc,
        "price": price,
        "product_pic": productPic,
        "t_userupdate": tUserupdateValues.reverse[tUserupdate],
        "t_ipaddress": tIpaddress,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
        "picture": picture,
    };
}

enum TUserupdate { MUHAMMAD_MA_SUM, ACHMAD_DANDI, ANDIKA_LEONARDO }

final tUserupdateValues = EnumValues({
    "Achmad Dandi": TUserupdate.ACHMAD_DANDI,
    "Andika Leonardo": TUserupdate.ANDIKA_LEONARDO,
    "Muhammad Ma'sum": TUserupdate.MUHAMMAD_MA_SUM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}