import 'package:flutter/material.dart';

class MyCatculator extends StatefulWidget {
  const MyCatculator({super.key});
  
  @override
  State<MyCatculator> createState() => _MyCatculatorState();
}

class _MyCatculatorState extends State<MyCatculator> {

  String equation = "0";
  String result = "0";
  String expression = "0";
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyCatculator"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: equationFontSize),),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(equation,style: TextStyle(fontSize: resultFontSize),),
          ),

          const Expanded(
            child: Divider(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ]
      ),
    );
  }
}
