import 'package:flutter/material.dart';
import 'package:mini_katalog/models/product.dart';
import 'package:mini_katalog/screens/product_detail_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartStore.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Sepetim')),
      body: ValueListenableBuilder<List<Product>>(
        valueListenable: cart,
        builder: (context, products, _) {
          if (products.isEmpty) {
            return const Center(child: Text('Sepetiniz henüz boş.'));
          }
          final total = products.fold<double>(0, (sum, item) => sum + item.price);
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ListTile(
                      leading: Icon(IconData(product.iconCode, fontFamily: 'MaterialIcons')),
                      title: Text(product.name),
                      subtitle: Text('${product.price.toStringAsFixed(2)} ₺'),
                      trailing: IconButton(
                        tooltip: 'Sepetten çıkar',
                        onPressed: () => cart.removeAt(index),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('Toplam'),
                    Text(
                      '${total.toStringAsFixed(2)} ₺',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

