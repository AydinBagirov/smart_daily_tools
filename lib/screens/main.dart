import 'package:flutter/material.dart';
import 'converter_list_screen.dart';

void main() {
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
