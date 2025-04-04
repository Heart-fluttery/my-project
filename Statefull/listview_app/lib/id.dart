import 'package:flutter/material.dart';
import 'package:listview_app/model/pass.dart';

class Id extends StatefulWidget {
  const Id({super.key});

  @override
  State<Id> createState() => _IdState();
}

class _IdState extends State<Id> {
  late TextEditingController idcontroller;
  late TextEditingController passcontroller;

  @override
  void initState() {
    super.initState();
    idcontroller = TextEditingController();
    passcontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Icon(
              Icons.supervised_user_circle_rounded,
              size: 200,
              color: Colors.blueAccent,
            ),
            TextField(
              controller: idcontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: '아이디를 입력해주세요'
              ),
            ),
            TextField(
              controller: passcontroller,
              keyboardType: TextInputType.text,
              obscureText: true, // 입력한 텍스트 안 보이게
              decoration: InputDecoration(
                labelText: '패스워드를 입력해주세요'
              ),
            ),
            ElevatedButton(
              onPressed: _showdialog, 
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  } // build

  // ---- Functions ----
  _showdialog(){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text(idcontroller.text == Pass().id? '환영합니다' : '다시 시도해 주세요'),
        );
      },
    );
  }
} // Class