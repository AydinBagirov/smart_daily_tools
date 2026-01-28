import 'package:flutter/material.dart';
import '../weight_converter.dart';
import '../weight_unit.dart';

class WeightScreen extends StatefulWidget {
  @override
  _WeightScreenState createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  WeightUnit fromUnit = WeightUnit.kilogram;
  WeightUnit toUnit = WeightUnit.gram;
  TextEditingController controller = TextEditingController();
  double? result;

  void convert() {
    double value = double.tryParse(controller.text) ?? 0;
    setState(() {
      result = WeightConverter.convert(
          value: value, from: fromUnit, to: toUnit);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weight Converter',
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
                  child: DropdownButton<WeightUnit>(
                    value: fromUnit,
                    items: WeightUnit.values
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
                  child: DropdownButton<WeightUnit>(
                    value: toUnit,
                    items: WeightUnit.values
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
    );
  }
}
