import 'package:flutter/material.dart';

class PortraitMode extends StatefulWidget {
  const PortraitMode({super.key});

  @override
  State<PortraitMode> createState() => _PortraitModeState();
}

class _PortraitModeState extends State<PortraitMode> {
  // Property
  late String portButtonText;
  late Color portColor;

  @override
  void initState() {
    super.initState();
    portButtonText = "Hello";
    portColor = Colors.blueAccent;
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
                    portButtonText = 'Flutter';
                    portColor = Colors.red;
                  }else{
                    portButtonText = 'Hellow';
                    portColor = Colors.blueAccent;
                  }
                  setState(() {});
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: portColor,
                  foregroundColor: Colors.black
                ),
                child: Text(portButtonText),
              ),
            ],
          ),
        )
      ],
    );
  }
}