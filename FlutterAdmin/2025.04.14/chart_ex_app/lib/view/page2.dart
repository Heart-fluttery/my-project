import 'package:chart_ex_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Page2 extends StatefulWidget {
  final List<DeveloperData> list;
  const Page2({super.key, required this.list});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
        child: SfCartesianChart(
          title: ChartTitle(text: 'Yearly Growth in the Flutter Community'),
          tooltipBehavior: tooltipBehavior,
          legend: Legend(isVisible: true),
          series: [
            LineSeries<DeveloperData, int>(
                color: Theme.of(context).colorScheme.primary,
                name: 'Developers',
                dataSource: widget.list,
                xValueMapper: (DeveloperData years, _) => years.year, /* X축 데이터
                year만 가져오기 위해 years(변수)에 부여 _에는 원래 index가 들어왔는데 필요없어서 _ 씀
                */
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true), // 막대별 수치 보이게
                enableTooltip: true, // 툴팁 정의해놓고 여기서 쓸지말지 결정
              ),
          ],
        ),
      ),
    );
  }
}