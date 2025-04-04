import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/model/user_frame.dart';
import 'package:todolist_my_test_app/view/page/mainscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController idcontroller; // 아이디 입력
  late TextEditingController pwcontroller; // 비밀번호 입력
  late List<Userframe> useridpw; // 유저 아이디 비밀번호

  @override
  void initState() {
    super.initState();
    idcontroller = TextEditingController();
    pwcontroller = TextEditingController();
    useridpw = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 300,
        title: CircleAvatar(
          radius: 100,
          backgroundColor: Colors.blueAccent,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 150,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // CircleAvatar( // appbar로 이동
              //   radius: 100,
              //   backgroundColor: Colors.blueAccent,
              //   child: Icon(
              //     Icons.person,
              //     color: Colors.white,
              //     size: 150,
              //   ),
              // ),
              TextField(
                controller: idcontroller,
                maxLines: 1,
                maxLength: 40,
                decoration: InputDecoration(
                  hintText: '아이디를 입력해 주세요',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
              TextField(
                controller: pwcontroller,
                obscureText: true,
                maxLines: 1,
                maxLength: 40,
                decoration: InputDecoration(
                  hintText: '비밀번호를 입력해 주세요',
                  hintStyle: TextStyle(
                    color: Colors.grey
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  idpwCheck();
                }, 
                child: Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  idpwCheck(){
    if (idcontroller.text != Userdata.idpw[0].userid || pwcontroller.text != Userdata.idpw[0].userpw) {
      Get.snackbar(
        '다시 확인해 주세요',
        '아이디 또는 비밀번호가 불일치 합니다',
      );
    }else if (idcontroller.text == Userdata.idpw[0].userid && pwcontroller.text == Userdata.idpw[0].userpw){
      Get.snackbar(
        '환영합니다', 
        'Heart-Fluttery',
      );
      Get.off(Mainscreen());
    }
  }
} // class