import 'package:flutter/material.dart';

class LandscapeMode extends StatefulWidget {
  const LandscapeMode({super.key});

  @override
  State<LandscapeMode> createState() => _LandscapeModeState();
}

class _LandscapeModeState extends State<LandscapeMode> {
  // Property
  late String portButtonText;
  late Color portColor;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    portButtonText = "Flutter";
    portColor = Colors.blueAccent;
    switchValue = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack( // home의 바디에서 이 페이지를 불러서 Stack으로 시작
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if(portColor == Colors.blueAccent){
                    portColor = Colors.red;
                    switchValue = true;
                  }else{
                    portColor = Colors.blueAccent;
                    switchValue = false;
                  }
                  setState(() {});
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: portColor,
                  foregroundColor: Colors.black
                ),
                child: Text(portButtonText),
              ),
              Switch(
                value: switchValue, 
                onChanged: (value) {
                  switchValue = value;
                  portColor = switchValue ? Colors.red : Colors.blueAccent;
                  setState(() {});
                }
              ),
            ],
          ),
        )
      ],
    );
  }
}