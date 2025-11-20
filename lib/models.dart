import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final List<Product> products;

  Category({required this.name, required this.icon, required this.products});
}

class Product {
  final String name;
  final IconData icon;
  final String price;
  final String? imageUrl;

  Product({
    required this.name,
    required this.icon,
    required this.price,
    this.imageUrl,
  });
}
