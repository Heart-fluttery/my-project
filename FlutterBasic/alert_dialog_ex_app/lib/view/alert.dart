import 'package:flutter/material.dart';

class Alert extends StatelessWidget {
  const Alert({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('Alert and push',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text(
            'Page 이동'
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  _showDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          title: Text('Page 이동'),
          content: Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.redAccent
              ),
              child: Text("Cancel",
              style: TextStyle(
                color: Colors.white
              ),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/second');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueAccent
              ),
              child: Text("Page 이동",
              style: TextStyle(
                color: Colors.white
              ),),
            ),
          ],
        );
      }
    );
  }
} // Alert