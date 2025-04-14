import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController _guguDan;
  late List<int> dan;
  late int selectedDan;
  late String result;

  @override
  void initState() {
    super.initState();
    _guguDan = TextEditingController();
    result = "";
    selectedDan = 0;
    dan = List.generate(8, (index) => index + 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${dan[selectedDan]}단'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 250,
              child: CupertinoPicker(
                itemExtent: 50,
                scrollController: FixedExtentScrollController(), 
                onSelectedItemChanged: (value) {
                  selectedDan = value;
                  _guguDan.text = "";
                  for (var i = 1; i < 10; i++) {
                    _guguDan.text += '${dan[selectedDan]} * $i = ${dan[selectedDan]*i}\n';
                  }
                  setState(() {});
                }, 
                children: List.generate(
                  dan.length, 
                  (index) => Center(
                    child: Text('${dan[index]}단'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: SizedBox(
                width: 200,
                child: CupertinoTextField(
                  controller: _guguDan,
                  maxLines: 10,
                  textAlign: TextAlign.left,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inversePrimary),
                  readOnly: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}