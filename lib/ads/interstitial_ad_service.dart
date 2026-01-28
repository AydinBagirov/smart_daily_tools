import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdService {
  static InterstitialAd? _interstitialAd;

  // Buton tıklama sayacı (statik, uygulama boyunca kalır)
  static int _clickCount = 0;

  // Minimum dakika aralığı zaman bazlı reklam için
  static const int minMinutesBetweenAds = 2;
  static DateTime _lastTimeShown = DateTime.fromMillisecondsSinceEpoch(0);

  // Timer ile otomatik reklam (isteğe bağlı)
  static Timer? _timer;

  /// Timer başlat
  static void startTimer() {
    if (_timer != null) return;

    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      _showTimeBasedAdIfNeeded();
    });

    loadAd();
  }

  /// Interstitial reklam yükle
  static void loadAd() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', // Test ID
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  /// Convert butonuna tıklandığında çağır
  static void showAdOnClick() {
    _clickCount++;

    if (_clickCount >= 3) {
      _showAd();
      _clickCount = 0; // Sayaç sıfırlandı
    }
  }

  /// Zaman bazlı reklam
  static void _showTimeBasedAdIfNeeded() {
    final now = DateTime.now();
    if (_interstitialAd != null &&
        now.difference(_lastTimeShown).inMinutes >= minMinutesBetweenAds) {
      _showAd();
    }
  }

  /// Reklamı göster
  static void _showAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      _lastTimeShown = DateTime.now();
      loadAd(); // Her gösterim sonrası yeni reklam yükle
    }
  }

  /// Timer iptal
  static void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
