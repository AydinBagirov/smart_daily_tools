import 'dart:async';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdService {
  static InterstitialAd? _interstitialAd;
  static DateTime _lastTimeShown = DateTime.fromMillisecondsSinceEpoch(0);
  static int _clickCount = 0;
  static const int minMinutesBetweenAds = 2;
  static Timer? _timer;

  static void startTimer() {
    if (_timer != null) return;

    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      _showTimeBasedAdIfNeeded();
    });

    loadAd();
  }

  static void loadAd() {
    InterstitialAd.load(
      //adUnitId: 'ca-app-pub-6949454487878309/3984726740',
      adUnitId: 'ca-app-pub-3940256099942544/1033173712', //TEST_ID
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (error) => _interstitialAd = null,
      ),
    );
  }

  static void showAdOnClick() {
    _clickCount++;
    if (_clickCount % 3 == 0) {
      _showAd();
      _clickCount = 0;
    }
  }

  static void _showTimeBasedAdIfNeeded() {
    final now = DateTime.now();
    if (_interstitialAd != null &&
        now.difference(_lastTimeShown).inMinutes >= minMinutesBetweenAds) {
      _showAd();
    }
  }

  static void _showAd() {
    if (_interstitialAd != null) {
      _interstitialAd!.show();
      _interstitialAd = null;
      _lastTimeShown = DateTime.now();
      loadAd();
    }
  }

  static void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
