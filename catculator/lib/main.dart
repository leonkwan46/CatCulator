import 'package:flutter/material.dart';
import 'catculator.dart';

void main() {
  runApp(const Catculator());
}

class Catculator extends StatelessWidget {
  const Catculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Catculator',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Georgia',
      ),
      home: MyCatculator()
    );
  }
}
