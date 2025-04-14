// 구성이 똑같아서 bar_chart 복사해서 씀
import 'package:chart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieChart extends StatefulWidget {
  const PieChart({super.key});

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  // Property
  late List<DeveloperData> data;
  late TooltipBehavior tooltipBehavior; // 툴팁, 선택사항

  @override
  void initState() {
    super.initState();
    data = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData(); // 나중에는 여기에 async가 필요함
  }

  addData(){
    data.add(DeveloperData(year: 2017, developers: 19000));
    data.add(DeveloperData(year: 2018, developers: 40000));
    data.add(DeveloperData(year: 2019, developers: 35000));
    data.add(DeveloperData(year: 2020, developers: 37000));
    data.add(DeveloperData(year: 2021, developers: 45000));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCircularChart( // pie chart는 이 부분부터 다름
            title: ChartTitle(text: 'Yearly Growth in the Flutter Community'),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true), // series의 name 활성화, 누르면 그래프 비활성화됨
            series: <CircularSeries<DeveloperData, int>>[
              PieSeries<DeveloperData, int>(
                name: 'Developers',
                dataSource: data,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}