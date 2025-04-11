import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late List<String> animalList;
  late List<Color> animalColor;
  late String selectedName;

  @override
  void initState() {
    super.initState();
    animalList = [
      'bee',
      'cat',
      'cow',
      'dog',
      'fox',
      'monkey',
      'pig',
      'wolf',
    ];
    animalColor = [
      Colors.yellowAccent,
      Colors.yellowAccent,
      Colors.yellowAccent,
      Colors.yellowAccent,
      Colors.yellowAccent,
      Colors.yellowAccent,
      Colors.yellowAccent,
      Colors.yellowAccent,
    ];

    selectedName = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll & Builder Test'),
      ),
      body: Column(
        children: [
          Text('원하는 동물을 선택하세요'),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: animalList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => rebuildBorder(index),
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(5), // 이미지와 컨테이너 사이 두께
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: animalColor[index],
                        width: 2,
                      )
                    ),
                    child: Image.asset(
                      'images/${animalList[index]}.png',
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(selectedName),
          ),
        ],
      ),
    );
  } // build

  rebuildBorder(int index){
    for(int i=0; i<animalList.length; i++){
      animalColor[i] = Colors.yellowAccent;
    }
    animalColor[index] = Colors.redAccent;
    selectedName = animalList[index];
    setState(() {});
  }
} // class