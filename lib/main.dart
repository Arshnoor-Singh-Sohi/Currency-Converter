import 'package:currency_converter/currency_converter_cupertino_page.dart';
import 'package:currency_converter/currency_converter_material_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import './pages/currency_converter_material_page.dart'; // relative importing

void main(){
  runApp(const MyCupertinoApp());
}

// Types of Widgets
// 1. StatelessWidget // data is immutable // state cannot change
// 2. StatefulWidget // data is mutable // state can change

// State is some data that your widget will care about

// 1. Material Design  // Google
// 2. Cupertino Design // Apple

class MyApp extends StatelessWidget{
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverterMaterialPage(),
    );
  }

}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: CurrencyConverterCupertinoPage(),
    );
  }
}