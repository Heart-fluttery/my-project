import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  // Property
  late String userId; // 화면에서 변하지는 않지만 외부에서 받는거라 생성
  late String password;

  @override
  void initState() {
    super.initState();
    userId = "";
    password = "";
    initSharedPreferences();
  }

  initSharedPreferences()async{
    final prefs = await SharedPreferences.getInstance(); // 이 부분은 쓸 때마다 적어줘야함
    userId = prefs.getString('p_userId')!;
    password = prefs.getString('p_password')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ID와 Password 출력'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User ID : $userId'),
            Text('Password : $password'),
          ],
        ),
      ),
    );
  }
}