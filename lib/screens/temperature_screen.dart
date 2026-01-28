import 'package:flutter/material.dart';
import '../ads/banner_ad_widget.dart';
import '../temperature_converter.dart';
import '../temperature_unit.dart';

class TemperatureScreen extends StatefulWidget {
  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  TemperatureUnit fromUnit = TemperatureUnit.celsius;
  TemperatureUnit toUnit = TemperatureUnit.fahrenheit;
  TextEditingController controller = TextEditingController();
  double? result;

  void convert() {
    double value = double.tryParse(controller.text) ?? 0;
    setState(() {
      result = TemperatureConverter.convert(
          value: value, from: fromUnit, to: toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Temperature Converter',
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
                  child: DropdownButton<TemperatureUnit>(
                    value: fromUnit,
                    items: TemperatureUnit.values
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
                  child: DropdownButton<TemperatureUnit>(
                    value: toUnit,
                    items: TemperatureUnit.values
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
                backgroundColor: Colors.teal, // Buton rengi
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
