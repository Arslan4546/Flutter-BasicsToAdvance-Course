import 'dart:convert';

import 'package:flutter/widgets.dart';

class ShoeModel {
  String? id;
  String? name;
  String? brand;
  String? imgSrc;
  double? price;
  int? size;
  String? color;
  String? description;

  ShoeModel({
    this.id,
    this.name,
    this.brand,
    this.imgSrc,
    this.price,
    this.size,
    this.color,
    this.description,
  });

  ShoeModel copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? name,
    ValueGetter<String?>? brand,
    ValueGetter<String?>? imgSrc,
    ValueGetter<double?>? price,
    ValueGetter<int?>? size,
    ValueGetter<String?>? color,
    ValueGetter<String?>? description,
  }) {
    return ShoeModel(
      id: id != null ? id() : this.id,
      name: name != null ? name() : this.name,
      brand: brand != null ? brand() : this.brand,
      imgSrc: imgSrc != null ? imgSrc() : this.imgSrc,
      price: price != null ? price() : this.price,
      size: size != null ? size() : this.size,
      color: color != null ? color() : this.color,
      description: description != null ? description() : this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'imgSrc': imgSrc,
      'price': price,
      'size': size,
      'color': color,
      'description': description,
    };
  }

  factory ShoeModel.fromMap(Map<String, dynamic> map) {
    return ShoeModel(
      id: map['id'],
      name: map['name'],
      brand: map['brand'],
      imgSrc: map['imgSrc'],
      price: map['price']?.toDouble(),
      size: map['size']?.toInt(),
      color: map['color'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShoeModel.fromJson(String source) =>
      ShoeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShoeModel(id: $id, name: $name, brand: $brand, imgSrc: $imgSrc, price: $price, size: $size, color: $color, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShoeModel &&
        other.id == id &&
        other.name == name &&
        other.brand == brand &&
        other.imgSrc == imgSrc &&
        other.price == price &&
        other.size == size &&
        other.color == color &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        brand.hashCode ^
        imgSrc.hashCode ^
        price.hashCode ^
        size.hashCode ^
        color.hashCode ^
        description.hashCode;
  }

  static List<ShoeModel> shoesList = [
    ShoeModel(
      id: "1",
      name: "Air Jordan 1",
      brand: "Adidas",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAOnJUVaOOaZIuy1JjIEaJKkX9H9A7IAtI4v4DeqHsJw&s&ec=72940543",
      price: 150.0,
      size: 10,
      color: "Red",
      description: "The Air Jordan 1 is a classic basketball shoe.",
    ),
    ShoeModel(
      id: "2",
      name: "Yeezy Boost 350",
      brand: "Adidas",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAOnJUVaOOaZIuy1JjIEaJKkX9H9A7IAtI4v4DeqHsJw&s&ec=72940543",
      price: 220.0,
      size: 9,
      color: "Black",
      description: "The Yeezy Boost 350 is a stylish and comfortable sneaker.",
    ),
    ShoeModel(
      id: "3",
      name: "Puma RS-X",
      brand: "Puma",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV2n6acy1Z1PnyBtyPXMb4c-2yPQPn9Pin9PoItknLIg&s&ec=72940543",
      price: 110.0,
      size: 8,
      color: "Blue",
      description: "The Puma RS-X is a retro-inspired running shoe.",
    ),
    ShoeModel(
      id: "4",
      name: "Converse Chuck Taylor",
      brand: "Puma",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV2n6acy1Z1PnyBtyPXMb4c-2yPQPn9Pin9PoItknLIg&s&ec=72940543",
      price: 60.0,
      size: 11,
      color: "White",
      description: "The Converse Chuck Taylor is a timeless classic sneaker.",
    ),
    ShoeModel(
      id: "5",
      name: "New Balance 574",
      brand: "Puma",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTV2n6acy1Z1PnyBtyPXMb4c-2yPQPn9Pin9PoItknLIg&s&ec=72940543",
      price: 80.0,
      size: 9,
      color: "Gray",
      description: "The New Balance 574 is a versatile and durable sneaker.",
    ),
    ShoeModel(
      id: "6",
      name: "Reebok Classic",
      brand: "Nike",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIBE9VtmQH9LBxAUudqaTXH9OTFtr9nxsocnOV98p4ZQ&s&ec=72940543",
      price: 75.0,
      size: 10,
      color: "Black",
      description: "The Reebok Classic is a comfortable and stylish shoe.",
    ),
    ShoeModel(
      id: "7",
      name: "Vans Old Skool",
      brand: "Nike",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIBE9VtmQH9LBxAUudqaTXH9OTFtr9nxsocnOV98p4ZQ&s&ec=72940543",
      price: 65.0,
      size: 8,
      color: "Black/White",
      description: "The Vans Old Skool is a skateboarding classic.",
    ),
    ShoeModel(
      id: "8",
      name: "Asics Gel-Kayano",
      brand: "Nike",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIBE9VtmQH9LBxAUudqaTXH9OTFtr9nxsocnOV98p4ZQ&s&ec=72940543",
      price: 130.0,
      size: 10,
      color: "Green",
      description: "The Asics Gel-Kayano is a high-performance running shoe.",
    ),
    ShoeModel(
      id: "9",
      name: "Nike Air Max 90",
      brand: "Nike",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIBE9VtmQH9LBxAUudqaTXH9OTFtr9nxsocnOV98p4ZQ&s&ec=72940543",
      price: 120.0,
      size: 9,
      color: "White/Red",
      description:
          "The Nike Air Max 90 is a classic running shoe with a modern twist.",
    ),
    ShoeModel(
      id: "10",
      name: "Adidas Ultraboost",
      brand: "Nike",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIBE9VtmQH9LBxAUudqaTXH9OTFtr9nxsocnOV98p4ZQ&s&ec=72940543",
      price: 180.0,
      size: 10,
      color: "Black/Gray",
      description:
          "The Adidas Ultraboost is a premium running shoe with superior comfort.",
    ),
    ShoeModel(
      id: "11",
      name: "Under Armour HOVR",
      brand: "Nike",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIBE9VtmQH9LBxAUudqaTXH9OTFtr9nxsocnOV98p4ZQ&s&ec=72940543",
      price: 140.0,
      size: 10,
      color: "Blue/Gray",
      description:
          "The Under Armour HOVR is a lightweight and responsive running shoe.",
    ),
    ShoeModel(
      id: "12",
      name: "Saucony Jazz Original",
      brand: "Bata",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Do7g-J_Gw-A-HXu_wy-K7HGyOv9JA9WeDejaNyeDpQ&s&ec=72940543",
      price: 70.0,
      size: 9,
      color: "Navy/White",
      description:
          "The Saucony Jazz Original is a retro-inspired sneaker with a classic design.",
    ),
    ShoeModel(
      id: "13",
      name: "Fila Disruptor II",
      brand: "Bata",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Do7g-J_Gw-A-HXu_wy-K7HGyOv9JA9WeDejaNyeDpQ&s&ec=72940543",
      price: 85.0,
      size: 8,
      color: "White",
      description:
          "The Fila Disruptor II is a bold and chunky sneaker with a unique style.",
    ),
    ShoeModel(
      id: "14",
      name: "Hoka One One Clifton",
      brand: "Bata",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Do7g-J_Gw-A-HXu_wy-K7HGyOv9JA9WeDejaNyeDpQ&s&ec=72940543",
      price: 130.0,
      size: 10,
      color: "Orange/White",
      description:
          "The Hoka One One Clifton is a cushioned and lightweight running shoe.",
    ),
    ShoeModel(
      id: "15",
      name: "Brooks Ghost 14",
      brand: "Bata",
      imgSrc:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Do7g-J_Gw-A-HXu_wy-K7HGyOv9JA9WeDejaNyeDpQ&s&ec=72940543",
      price: 140.0,
      size: 9,
      color: "Black/Blue",
      description:
          "The Brooks Ghost 14 is a smooth and comfortable running shoe.",
    ),
  ];
}
