import 'package:flutter/material.dart';
import 'package:tipsy_calculator/TipCalculator/TipCalculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TipCalculator(),
//      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

