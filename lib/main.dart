import 'package:flutter/material.dart';
import 'package:project1/currency_convertor_material_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      // home: CurrencyConvertorMaterialPage()
      home:CurrencyConverterMaterialPage()
      // home: WeatherScreen()
      );
  }
}
