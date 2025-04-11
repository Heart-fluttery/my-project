import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late String _lampImage;     // 이미지 파일 이름
  late double _lampWidth;     // 이미지 Width
  late double _lampHeight;    // 이미지 Height
  late String _buttonName;    // 버튼 title
  late bool _switch;          // Switch 켜짐 상태
  late bool _lampSizeStatus;  // 현재 화면의 Lamp의 크기
  late double _rotation;      // 회전 각도

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = "확대"; // 첫화면은 작은 램프라서 확대버튼
    _switch = true;
    _lampSizeStatus = false;
    _rotation = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 550,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotationTransition(
                    turns: AlwaysStoppedAnimation(_rotation / 360),
                    child: Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                      ),
                  ),
                ],
              ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      decisionLampSize();
                    }, 
                    child: Text(_buttonName),
                  ),
                  Column(
                    children: [
                      Text(
                        '전구 스위치',
                        style: TextStyle(
                          fontSize: 10
                        ),
                      ),
                      Switch(
                        value: _switch, 
                        onChanged: (value) {
                          _switch = value;
                          decisionOnOff();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            SizedBox( // 슬라이더가 크다면 SizedBox로 조절
              width: 200,
              child: Slider(
                min: 0,
                max: 360,
                value: _rotation,
                onChanged: (value) {
                  _rotation = value;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  decisionLampSize(){
    if(_lampSizeStatus == true){
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = 'Image 확대';
      _lampSizeStatus = false;
    }else{
      _lampWidth = 250;
      _lampHeight = 500;
      _buttonName = '축소';
      _lampSizeStatus = true;
    }
    
    setState(() {});
  }

  decisionOnOff(){
    _lampImage = _switch ? 'images/ratedit.gif' : 'images/ratedit_out2.gif';
    setState(() {});
  }
} // class