import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imageName; // 전구 이름
  late bool imageState; // 전구 상태

  @override
  void initState() {
    super.initState();
    imageState = true;
    imageName = 'lamp_on.png';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert를 이용한 메세지 출력'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 400,
              child: Column(
                children: [
                  Image.asset(
                    'images/${imageName = imageState == true? 'lamp_on.png' : 'lamp_off.png'}',
                    width: 250,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        bool value = true;
                        _showDialog(context, value);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      child: Text(
                        '켜기',
                        style: TextStyle(
                        ),
                      ),
                    ),
                  ),
              ElevatedButton(
                onPressed: () {
                  bool value = false;
                  _showDialog(context, value);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )
                ),
                child: Text(
                  '끄기',
                  style: TextStyle(
                  ),
                ),
              ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } // build

    // ---- Functions ----
  _showDialog(BuildContext context, bool value){
    if (imageState != value) { // 전구 상태와 버튼 값 다른 경우
    showCupertinoModalPopup(context: 
      context, 
      builder: (context) => CupertinoActionSheet(
        title: Text('램프끄기'),
        message: Text('램프를 끄시겠습니까?'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              imageName = 'images/lamp_off.png';
              imageState = false;
              setState(() {});
            }, 
            child: Text('예'),
          ),
          CupertinoActionSheetAction(
            onPressed: () => Get.back(), 
            child: Text('아니오'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Get.back(),
          child: Text('Cancle'),
        ),
      ),
    );
    }else{ // 전구 상태와 버튼 값 같은 경우
      Get.defaultDialog(
          title: "램프 ${value != true? '켜기' : '끄기'}",
          // value(버튼값)이 ture 일 때 전구는 꺼져있음
          content: Text('램프를 ${value != true? '켜' : '끄'}시겠습니까?'),
          actions: [
            TextButton(
              onPressed: () {
                imageState = value != true? true : false;
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent
              ),
              child: Text("네",
              style: TextStyle(
                color: Colors.white
              ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent
              ),
              child: Text("아니오",
              style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        );
      }
    setState(() {});
    }
  }// class