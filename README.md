# Mini Katalog Uygulaması

Flutter günlük eğitimi için hazırlanmış, paket bağımlılığı bulunmayan örnek katalog uygulaması. Ürün arama/filtreleme, kart tabanlı liste, detay sayfası, named route ile argument taşıma ve bellek içi sepet simülasyonu içerir.

## Kullanılan sürüm

- Flutter: 3.24 veya üzeri
- Dart: 3.3 veya üzeri

Kesin yerel sürümü görmek için `flutter --version` komutunu çalıştırın.

## Çalıştırma

1. [Flutter SDK](https://docs.flutter.dev/get-started/install) ve Android Studio'yu kurun.
2. Bu klasörde platform dosyaları yoksa bir kez `flutter create --platforms=android .` çalıştırın.
3. `flutter pub get` komutunu çalıştırın.
4. Emülatörü veya fiziksel Android cihazı açın.
5. `flutter run` komutunu çalıştırın.

Kontroller: `flutter analyze` ve `flutter test`.

## Proje yapısı

- `lib/models`: Ürün veri modeli ve JSON dönüşümleri
- `lib/data`: Yerel JSON veri kaynağı
- `lib/screens`: Katalog, detay ve sepet ekranları
- `lib/widgets`: Tekrar kullanılabilir ürün kartı
- `lib/theme`: Material 3 tema ayarları
- `assets`: Yerel ürün verisi ve banner

## Veri ve güvenlik notu

Uygulama çalışma zamanında ağ bağlantısı, kimlik bilgisi veya kişisel veri istemez. Eğitim dokümanındaki `wantapi.com` adresleri gerçek e-ticaret altyapısı değildir ve uygulamaya doğrudan bağlanmamıştır. Ürünler doğrulanabilir yerel JSON dosyasından okunur; sepet yalnızca uygulama belleğinde tutulur ve ödeme işlemi yapmaz.

Demo kaynakları: [banner](https://wantapi.com/assets/banner.png), [ürünler](https://wantapi.com/products.php). Alternatifler: [Fake Store API](https://fakestoreapi.com/products), [DummyJSON](https://dummyjson.com/products).

## Teslim kontrol listesi

- Public GitHub repository URL'i
- Çalışan proje ve bu README dosyası
- Kullanılan Flutter sürümü
- Ana ekran, ürün detayı ve sepet ekran görüntüleri (`screenshots/` klasörüne eklenmeli)

> GitHub adresi ve gerçek cihaz/emülatör ekran görüntüleri öğrenciye özgü olduğundan teslim öncesinde ayrıca eklenmelidir.

