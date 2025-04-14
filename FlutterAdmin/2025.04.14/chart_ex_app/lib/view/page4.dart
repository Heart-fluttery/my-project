import 'package:chart_ex_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Page4 extends StatefulWidget {
  final List<DeveloperData> list;
  const Page4({super.key, required this.list});

  @override
  State<Page4> createState() => _Page1State();
}

class _Page1State extends State<Page4> {
  // Property
  late TooltipBehavior tooltipBehavior;

  @override
  void initState() {
    super.initState();
    tooltipBehavior = TooltipBehavior();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
        child: SfCircularChart(
          title: ChartTitle(text: 'Yearly Growth in the Flutter Community'),
          tooltipBehavior: tooltipBehavior,
          legend: Legend(isVisible: true),
          series: <CircularSeries<DeveloperData, int>>[
              PieSeries<DeveloperData, int>(
                name: 'Developers',
                dataSource: widget.list,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              )
            ],
        ),
      ),
    );
  }
}