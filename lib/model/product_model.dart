import 'package:flutter/material.dart';

class ProductModel {
  ProductModel({
    required this.furnitureId,
    required this.furnitureName,
    required this.furnitureType,
    required this.furnitureColor,
    required this.furnitureSizes,
    required this.furniturePrice,
    required this.isAvailable,
  });

  final String furnitureId;
  final String furnitureType;
  final String furnitureName;
  final List<Color> furnitureColor;
  final List<String> furnitureSizes;
  final double furniturePrice;
  bool isAvailable;

  static fromJson(Map<String, dynamic> json) {
    return ProductModel(
        furnitureId: json['furnitureId'],
        furnitureName: json['furnitureName'],
        furnitureType: json['furnitureType'],
        furnitureColor: json['furnitureColor'],
        furnitureSizes: json['furnitureSizes'],
        furniturePrice: json['furniturePrice'],
        isAvailable: json['isAvailable']);
  }

  toJson() {
    return {
      'furnitureId': furnitureId,
      'furnitureName': furnitureName,
      'furnitureType': furnitureType,
      'furnitureColor': furnitureColor,
      'furnitureSizes': furnitureSizes,
      'furniturePrice': furniturePrice,
      'isAvailable': isAvailable,
    };
  }
}
