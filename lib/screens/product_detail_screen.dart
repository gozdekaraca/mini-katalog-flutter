import 'package:flutter/material.dart';
import 'package:mini_katalog/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({required this.product, super.key});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Ürün Detayı')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 11,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.secondaryContainer,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  IconData(product.iconCode, fontFamily: 'MaterialIcons'),
                  size: 100,
                  color: colors.onSecondaryContainer,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(product.category, style: TextStyle(color: colors.primary)),
            const SizedBox(height: 6),
            Text(product.name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 12),
            Text(product.description, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
            Text(
              '${product.price.toStringAsFixed(2)} ₺',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: colors.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: FilledButton.icon(
          onPressed: () {
            CartStore.of(context).add(product);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text('${product.name} sepete eklendi.')));
          },
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('Sepete Ekle'),
        ),
      ),
    );
  }
}

class CartStore extends InheritedNotifier<ValueNotifier<List<Product>>> {
  const CartStore({required super.notifier, required super.child, super.key});

  static ValueNotifier<List<Product>> of(BuildContext context) {
    final store = context.dependOnInheritedWidgetOfExactType<CartStore>();
    assert(store != null, 'CartStore bulunamadı.');
    return store!.notifier!;
  }
}

extension CartActions on ValueNotifier<List<Product>> {
  void add(Product product) => value = <Product>[...value, product];
  void removeAt(int index) {
    final updated = List<Product>.of(value)..removeAt(index);
    value = updated;
  }
}

