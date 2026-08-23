import 'package:flutter/material.dart';
import 'package:mini_katalog/models/product.dart';
import 'package:mini_katalog/screens/cart_screen.dart';
import 'package:mini_katalog/screens/catalog_screen.dart';
import 'package:mini_katalog/screens/product_detail_screen.dart';
import 'package:mini_katalog/theme/app_theme.dart';

class MiniCatalogApp extends StatefulWidget {
  const MiniCatalogApp({super.key});

  @override
  State<MiniCatalogApp> createState() => _MiniCatalogAppState();
}

class _MiniCatalogAppState extends State<MiniCatalogApp> {
  final ValueNotifier<List<Product>> _cart = ValueNotifier<List<Product>>(<Product>[]);

  @override
  void dispose() {
    _cart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CartStore(
      notifier: _cart,
      child: MaterialApp(
        title: 'Mini Katalog',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute<void>(builder: (_) => const CatalogScreen());
            case '/cart':
              return MaterialPageRoute<void>(builder: (_) => const CartScreen());
            case '/detail':
              final argument = settings.arguments;
              if (argument is Product) {
                return MaterialPageRoute<void>(
                  builder: (_) => ProductDetailScreen(product: argument),
                );
              }
              return _invalidRoute();
            default:
              return _invalidRoute();
          }
        },
      ),
    );
  }

  MaterialPageRoute<void> _invalidRoute() => MaterialPageRoute<void>(
        builder: (_) => Scaffold(
          appBar: AppBar(title: const Text('Sayfa bulunamadı')),
          body: const Center(child: Text('İstenen sayfa açılamadı.')),
        ),
      );
}

