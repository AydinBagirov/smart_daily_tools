import 'package:flutter/material.dart';
import 'package:smart_daily_tools/screens/temperature_screen.dart';
import 'package:smart_daily_tools/screens/weight_screen.dart';
import '../ads/banner_ad_widget.dart';
import '../currency_screen.dart';
import 'length_screen.dart';

class ConverterListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tools = [
    {'name': 'Length Converter', 'screen': LengthScreen()},
    {'name': 'Weight Converter', 'screen': WeightScreen()},
    {'name': 'Temperature Converter', 'screen': TemperatureScreen()},
    {'name': 'Currency Converter', 'screen': CurrencyScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Smart Daily Tools',
          style: TextStyle(
            fontFamily: 'Roboto', // Yazı fontu
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal, // AppBar rengi
      ),
      body: Container(
        color: Colors.lightBlue[50], // Arka plan rengi
        child: ListView.builder(
          itemCount: tools.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white, // Kart rengi
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  tools[index]['name'],
                  style: TextStyle(
                    fontFamily: 'Roboto', // Yazı fontu
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.teal[800], // Yazı rengi
                  ),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.teal),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => tools[index]['screen'],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BannerAdWidget()
    );
  }
}
