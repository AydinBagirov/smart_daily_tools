import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ads/interstitial_ad_service.dart';
import 'screens/converter_list_screen.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ AdMob'u başlat
  await MobileAds.instance.initialize();

  // ✅ Interstitial Ad servisini başlat
  InterstitialAdService.loadAd();

  runApp(SmartDailyToolsApp());
}

class SmartDailyToolsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Daily Tools',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConverterListScreen(),
    );
  }
}
