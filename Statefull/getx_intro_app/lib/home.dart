import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Navigation'),
            ElevatedButton(
              onPressed: () => Get.to(SecondPage()), 
              child: Text('Get.to():화면 이동'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('/third'), 
              child: Text('Get.toNamed():화면 이동'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Snack Bar'),
            ElevatedButton(
              onPressed: () => buttonSnack(), 
              child: Text('SnackBar보이기'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Dialog'),
            ElevatedButton(
              onPressed: () => buttonDialog(), 
              child: Text('Dialog보이기'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Bottom Sheet'),
            ElevatedButton(
              onPressed: () => buttonBottomSheet(), 
              child: Text('Bottom Sheet보이기'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Screen Transition'),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  SecondPage(),
                  transition: Transition.fade,
                  duration: Duration(seconds: 3),
                );
              }, 
              child: Text('Get.to(): Transition'),
            ),
            ElevatedButton(
              onPressed: () => Get.toNamed('third2'), 
              child: Text('Get.toName(): Transition'),
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),
            Text('Navigation & Arguments'),
            ElevatedButton(
              onPressed: () => Get.to(
                SecondPage(),
                arguments: 'First'
              ), 
              child: Text('Get.to(): Single Arguments'),
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                SecondPage(),
                arguments: ['First', 'Second']
              ), 
              child: Text('Get.to(): Multiple Arguments'),
            ),
            ElevatedButton(
              onPressed: () async{
                var returnValue = await Get.to(SecondPage());
                Get.snackbar(
                  "Return Value", 
                  returnValue,
                );
              }, // async, await를 안 쓰면 값을 못 받음
              child: Text('Get.to(): Return Argument'),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  buttonSnack(){
    Get.snackbar(
      "Snack Bar", 
      "Message",
      snackPosition: SnackPosition.TOP, // BOTTOM도 있음
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
      colorText: Colors.white
      );
  }

  buttonDialog(){
    Get.defaultDialog(
      title: 'Dialog',
      middleText: 'Message',
      backgroundColor: Colors.amberAccent,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('Exit'),
        ),
      ]
    );
  }

  buttonBottomSheet(){
    Get.bottomSheet(
      Container(
        width: 500,
        height: 300,
        color: Colors.purple[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Text Line1'),
            Text('Text Line2'),
          ],
        ),
      )
    );
  }
} // class