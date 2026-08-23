import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mini_katalog/models/product.dart';

class ProductRepository {
  const ProductRepository();

  Future<List<Product>> loadProducts() async {
    final jsonText = await rootBundle.loadString('assets/data/products.json');
    final decoded = jsonDecode(jsonText);
    if (decoded is! List<dynamic>) {
      throw const FormatException('Ürün verisi liste biçiminde değil.');
    }

    return decoded
        .map((item) => Product.fromJson(item as Map<String, dynamic>))
        .toList(growable: false);
  }
}

