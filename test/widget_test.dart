import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_katalog/app.dart';

void main() {
  testWidgets('Katalog başlığı ve arama alanı görünür', (tester) async {
    await tester.pumpWidget(const MiniCatalogApp());
    await tester.pumpAndSettle();
    expect(find.text('Mini Katalog'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}

