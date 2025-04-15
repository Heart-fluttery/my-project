import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<String> items;
  late String dropDownValue;
  late String imageName;

  @override
  void initState() {
    super.initState();
    items = ['Apple', 'Banana', 'Grape', 'Orange', 'Pineapple', 'Watermelon'];
    dropDownValue = items[0];
    imageName = items[0];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              dropdownColor: Colors.lightBlueAccent,
              iconEnabledColor: Colors.black,
              value: dropDownValue, // 버튼에 뜨는 글자
              icon: Icon(Icons.keyboard_arrow_down), // 오른쪽에 뜨는 아이콘
              items: items.map((String items){
                return DropdownMenuItem(
                  value: items,
                  child: Text(
                    items,
                    style: TextStyle(
                      color: Colors.red
                    ),
                  ),
                );
              }).toList(),
              /*
              items는 타입이 List인데 DropdownMenuItem은 map만 받음
              그래서 맵으로 주고 마지막에 .toList()
              */
              onChanged: (value) {
                dropDownValue = value!;
                imageName = value;
                setState(() {});
              },
            ),
            Image.asset(
              'images/$imageName.png',
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}