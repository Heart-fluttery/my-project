// import 'package:chart_app/view/bar_chart.dart';
// import 'package:chart_app/view/line_chart.dart';
import 'package:chart_app/view/pie_chart.dart';
// import 'package:chart_app/view/scatter_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: const BarChart(),
      // home: const LineChart(),
      // home: const ScatterChart(),
      home: const PieChart(),
    );
  }
}