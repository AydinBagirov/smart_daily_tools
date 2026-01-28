import 'package:flutter/material.dart';
import '../currency_converter.dart';
import '../currency_unit.dart';
import 'ads/banner_ad_widget.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  CurrencyUnit fromUnit = CurrencyUnit.USD;
  CurrencyUnit toUnit = CurrencyUnit.EUR;
  TextEditingController controller = TextEditingController();
  double? result;

  void convert() {
    double value = double.tryParse(controller.text) ?? 0;
    setState(() {
      result = CurrencyConverter.convert(value: value, from: fromUnit, to: toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Currency Converter',
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
                  child: DropdownButton<CurrencyUnit>(
                    value: fromUnit,
                    items: CurrencyUnit.values
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
                  child: DropdownButton<CurrencyUnit>(
                    value: toUnit,
                    items: CurrencyUnit.values
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
              onPressed: convert,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text(
                'Convert',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
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
      bottomNavigationBar: BannerAdWidget()
    );
  }
}
