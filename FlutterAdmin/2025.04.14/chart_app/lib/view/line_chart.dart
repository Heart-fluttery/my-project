// 구성이 똑같아서 bar_chart 복사해서 씀
import 'package:chart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  // Property
  late List<DeveloperData> data1;
  late List<DeveloperData> data2;
  late TooltipBehavior tooltipBehavior; // 툴팁, 선택사항

  @override
  void initState() {
    super.initState();
    data1 = [];
    data2 = [];
    tooltipBehavior = TooltipBehavior(enable: true);
    addData(); // 나중에는 여기에 async가 필요함
  }

  addData(){
    data1.add(DeveloperData(year: 2017, developers: 19000));
    data1.add(DeveloperData(year: 2018, developers: 40000));
    data1.add(DeveloperData(year: 2019, developers: 35000));
    data1.add(DeveloperData(year: 2020, developers: 37000));
    data1.add(DeveloperData(year: 2021, developers: 45000));
    data2.add(DeveloperData(year: 2017, developers: 9000));
    data2.add(DeveloperData(year: 2018, developers: 20000));
    data2.add(DeveloperData(year: 2019, developers: 17000));
    data2.add(DeveloperData(year: 2020, developers: 18000));
    data2.add(DeveloperData(year: 2021, developers: 23000));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Line Chart'),
      ),
      body: Center(
        child: SizedBox(
          width: 380,
          height: 600,
          child: SfCartesianChart(
            title: ChartTitle(text: 'Yearly Growth in the Flutter Community'),
            tooltipBehavior: tooltipBehavior,
            legend: Legend(isVisible: true), // series의 name 활성화, 누르면 그래프 비활성화됨
            series: [
              LineSeries<DeveloperData, int>(
                color: Theme.of(context).colorScheme.primary,
                name: 'Developers1',
                dataSource: data1,
                xValueMapper: (DeveloperData years, _) => years.year, /* X축 데이터
                year만 가져오기 위해 years(변수)에 부여 _에는 원래 index가 들어왔는데 필요없어서 _ 씀
                */
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true), // 막대별 수치 보이게
                enableTooltip: true, // 툴팁 정의해놓고 여기서 쓸지말지 결정
              ),
              ColumnSeries<DeveloperData, int>(
                color: Colors.redAccent,
                name: 'Developers2',
                dataSource: data2,
                xValueMapper: (DeveloperData years, _) => years.year,
                yValueMapper: (DeveloperData developers, _) => developers.developers,
                dataLabelSettings: DataLabelSettings(isVisible: true), // 막대별 수치 보이게
                enableTooltip: true, // 툴팁 정의해놓고 여기서 쓸지말지 결정
              ),
            ],
            // X축을 Category로 표현
            primaryXAxis: CategoryAxis( // int에서 String으로 바뀜
              title: AxisTitle(text: '년도'),
            ),
            // Y축을 숫자로 표현
            primaryYAxis: NumericAxis( // 
              title: AxisTitle(text: '인원수'),
            ),
          ),
        ),
      ),
    );
  }
}