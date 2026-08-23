import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog/models/product.dart';

void main() {
  test('Product JSON dönüşümü veriyi korur', () {
    final json = <String, dynamic>{
      'id': 1,
      'name': 'Test Ürünü',
      'description': 'Açıklama',
      'price': 12.5,
      'category': 'Test',
      'iconCode': 57415,
    };
    final product = Product.fromJson(json);
    expect(product.toJson(), json);
  });
}

