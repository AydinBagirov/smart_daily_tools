import 'package:flutter/material.dart';
import 'package:smart_daily_tools/length_converter.dart';
import '../ads/banner_ad_widget.dart';
import '../ads/interstitial_ad_service.dart'; // ✅ Import ekle
import '../length_unit.dart';

class LengthScreen extends StatefulWidget {
  @override
  _LengthScreenState createState() => _LengthScreenState();
}

class _LengthScreenState extends State<LengthScreen> {
  LengthUnit fromUnit = LengthUnit.meter;
  LengthUnit toUnit = LengthUnit.kilometer;
  TextEditingController controller = TextEditingController();
  double? result;

  void convert() {
    // ✅ Reklam servisini çağır (3 tıklamada bir reklam gösterir)
    InterstitialAdService.showAdOnClick();

    double value = double.tryParse(controller.text) ?? 0;
    setState(() {
      result = LengthConverter.convert(value: value, from: fromUnit, to: toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Length Converter',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.lightBlue[50],
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Value',
                labelStyle: TextStyle(
                  fontFamily: 'Roboto',
                  color: Colors.teal[800],
                  fontWeight: FontWeight.w500,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: DropdownButton<LengthUnit>(
                    value: fromUnit,
                    items: LengthUnit.values
                        .map((e) => DropdownMenuItem(
                      child: Text(
                        e.name,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.teal[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: e,
                    ))
                        .toList(),
                    onChanged: (v) => setState(() => fromUnit = v!),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButton<LengthUnit>(
                    value: toUnit,
                    items: LengthUnit.values
                        .map((e) => DropdownMenuItem(
                      child: Text(
                        e.name,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Colors.teal[800],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: e,
                    ))
                        .toList(),
                    onChanged: (v) => setState(() => toUnit = v!),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: convert, // ✅ Bu fonksiyon artık reklam da gösterecek
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text(
                'Convert',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 16),
            if (result != null)
              Text(
                'Result: $result',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.teal[800],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAdWidget(),
    );
  }
}