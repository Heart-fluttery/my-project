import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Color buttonColor;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    buttonColor = Colors.blueAccent;
    switchValue = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Changed Button color on Switch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => buttonClick(),
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
              ),
              child: Text('Flutter'),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Switch(
                value: switchValue,
                onChanged: (value) {
                  switchValue = value;
                  switchChange();
                },
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Function ----
  switchChange(){
    buttonColor = switchValue == true? Colors.blueAccent : Colors.redAccent;
    setState(() {});
  }

  buttonClick(){
    buttonColor = buttonColor == Colors.blueAccent? Colors.redAccent : Colors.blueAccent;
    switchValue = !switchValue;
    setState(() {});
  }
} // class