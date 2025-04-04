import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  // Property
  late TextEditingController textEditingController;
  late String switchLabel;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    textEditingController.text = Message.contents;
    // 해당 화면에 있는 키보드에 Messge.contents를 입력
    if (Message.lampStatus){
      switchLabel = 'On';
      switchValue = true;
    }else{
      switchLabel = 'Off';
      switchValue = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textEditingController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabel),
                Switch(
                  value: switchValue, 
                  onChanged: (value) {
                    switchValue = value;
                    if (switchValue){
                      switchLabel = 'On';
                    }else{
                      switchLabel = 'Off';
                    }
                    setState(() {});
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Message.contents = textEditingController.text;
                Message.lampStatus = switchValue;
                Navigator.pop(context);
              }, 
              child: Text('Ok'),
            ),
          ],
        ),
      ),
    );
  }
}