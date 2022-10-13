import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const title = 'My Catculator';

    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Georgia',
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
          centerTitle: true,
        ),
        body: Center(
          child: Image.asset(assets/images/catculator.jpg),
        ),
      ),
    );
  }
}
