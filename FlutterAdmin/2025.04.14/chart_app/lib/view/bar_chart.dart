import 'package:chart_app/model/developer_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  const BarChart({super.key});

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
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
        title: Text('Bar Chart'),
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
              // 세로 막대 그래프
              // ColumnSeries<DeveloperData, int>(
              //   color: Theme.of(context).colorScheme.primary,
              //   name: 'Developers',
              //   dataSource: data,
              //   xValueMapper: (DeveloperData years, _) => years.year, /* X축 데이터
              //   year만 가져오기 위해 years(변수)에 부여 _에는 원래 index가 들어왔는데
              //   */
              //   yValueMapper: (DeveloperData developers, _) => developers.developers,
              //   dataLabelSettings: DataLabelSettings(isVisible: true), // 막대별 수치 보이게
              //   enableTooltip: true, // 툴팁 정의해놓고 여기서 쓸지말지 결정
              // ),

              // 가로 막대 그래프
              // 가로 막대의 x, y가 헷갈리면 세로막대그래프 먼저 만들고 이름만 BarSeries로 바꾸면 됨 
              BarSeries<DeveloperData, int>(
                color: Theme.of(context).colorScheme.primary,
                name: 'Developers',
                dataSource: data,
                xValueMapper: (DeveloperData years, _) => years.year, /* X축 데이터
                year만 가져오기 위해 years(변수)에 부여 _에는 원래 index가 들어왔는데 필요없어서 _ 씀
                */
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