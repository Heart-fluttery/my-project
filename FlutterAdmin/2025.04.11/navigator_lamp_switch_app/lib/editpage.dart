import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigator_lamp_switch_app/buttonvalue.dart';

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  late String color;
  late String onOff;
  late bool colorSwitch;
  late bool onOffSwitch;

  @override
  void initState() {
    super.initState();
    color = 'Yellow';
    onOff = 'On';
    colorSwitch = Buttonvalue.colorButton;
    onOffSwitch = Buttonvalue.onOffButton;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수정화면'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    colorSwitch==false?'Red':'',
                  ),
                ),
                Switch(
                  value: colorSwitch,
                  activeTrackColor: Colors.amberAccent,
                  inactiveTrackColor: Colors.redAccent,
                  onChanged: (value) {
                    colorSwitch = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    colorSwitch?'Yellow':'',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    onOffSwitch==false?'Off':'',
                  ),
                ),
                Switch(
                  value: onOffSwitch, 
                  onChanged: (value) {
                    onOffSwitch = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    onOffSwitch?'On':'',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                returnValue();
              }, 
              child: SizedBox(
                width: 50,
                child: Text(
                  'OK',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } // build
  returnValue(){
    Buttonvalue.colorButton = colorSwitch;
    Buttonvalue.onOffButton = onOffSwitch;
    Get.back();
  }
} // class