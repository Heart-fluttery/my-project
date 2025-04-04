import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Toast Message'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Fluttertoast.showToast( // 이렇게 클래스 뒤에 바로 괄호가 아니라 .showToast같이 오면 facktory
              msg: 'Toast Button is clicked.',
              gravity: ToastGravity.TOP,
              fontSize: 20,
              textColor: Colors.amberAccent,
              toastLength: Toast.LENGTH_SHORT
              );
          },
          child: Text("Toast Button"),
          ),
      ),
    );
  }
}